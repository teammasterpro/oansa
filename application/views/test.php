<?
    $connection = mysqli_connect('localhost', 'root', '12345678', 'oansa');
    if (empty ($_POST)) {
        ?>
            <!DOCTYPE html>
            <html lang="es">
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Test</title>
                </head>
                <body>
                    <select name="country">
                        <?
                            $result = mysqli_query($connection, 'SELECT id, nombre FROM pais');
                            while ($row = mysqli_fetch_object($result)) {
                                ?><option value="<?= $row->id ?>"><?= $row->nombre ?></option><?
                            }
                        ?>
                    </select>
                    <select name="region"></select>
                    <select name="city"></select>
                </body>
            </html>
        <?
    } else {
        $result = mysqli_query($connection, [
            'SELECT id, nombre FROM departamento WHERE pais = ' . $_POST['id'],
            'SELECT id, nombre FROM municipio WHERE departamento = ' . $_POST['id']
        ][ $_POST['query'] ]);
        $output = [];
        while ($row = mysqli_fetch_object($result))
            $output[] = $row;
        mysqli_close($connection);
        print json_encode($output)
    }