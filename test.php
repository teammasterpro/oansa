<?
    ini_set('display_errors', 'on');
    $connection = mysqli_connect('localhost', 'root', '12345678', 'oansa');

    if (empty ($_GET)) {
        ?>
            <!DOCTYPE html>
            <html lang="es">
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <script src="js/jquery-3.2.1.min.js"></script>
                    <script>
                        $(function () {
                            $('[name=country], [name=region]').change(function () {
                                var select = $({ country: '[name=region]', region: '[name=city]' }[ this.name ]);
                                select.children(':gt(0)').remove();
                                $.getJSON('test.php?query=' + this.name + '&id=' + this.value, function (data) {
                                    $.each(data, function (key, value) {
                                        $('<option>', {
                                            appendTo: select,
                                            text: value.name,
                                            val: value.id
                                        });
                                    });
                                });
                            });
                        });
                    </script>
                    <title>Test</title>
                </head>
                <body>
                    <select name="country">
                        <option value="">Pais</option>
                        <?
                            $result = mysqli_query($connection, 'SELECT * from v_pais');
                            while ($row = mysqli_fetch_object($result)) {
                                ?><option value="<?= $row->idPais ?>"><?= $row->Nombre ?></option><?
                            }
                        ?>
                    </select>
                    <select name="region"><option value="">Departamento</option></select>
                    <select name="city"><option value="">Municipio</option></select>
                </body>
            </html>
        <?
    } else {
        $result = mysqli_query($connection, [
            'country' => 'CALL ListarDepart('. $_GET['id'].')',
            'region' => 'CALL ListarMuni('. $_GET['id'].')'
        ][ $_GET['query'] ]);
        $output = [];
       
        while ($row = mysqli_fetch_object($result))
            $output[] = $row;
        mysqli_close($connection);
        print json_encode($output);
    }