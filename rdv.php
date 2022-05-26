<?php
    // A METTRE DANS LE HTML POUR OUVIR GRACE AU JS LA PAGE AVEC TOUS LES CRENEAUX DE LA BDD 
    // <input type="button" name="rdvButton" onClick="document.location.href='path.html'">
    /*if(array_key_exists('rdvButton', $_POST)) {
        $conn = mysqli_connect("localhost", "root", "", "edt");
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $sql = 'SELECT * FROM planning';

        $result = mysqli_query($conn, $sql);

        $planning = mysqli_fetch_all($result);

        mysqli_free_result($result);

        mysqli_close($conn);

        print_r($planning);

        // sql request to get the nom attribute sorted by sport
        $sql = 'SELECT nom FROM planning ORDER BY sport';
    }*/


    /*$conn = mysqli_connect("localhost", "root", "", "edt");
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $sql = 'SELECT nom, creneaux, sport FROM planning ORDER BY sport';

        $result = mysqli_query($conn, $sql);

        $planning = mysqli_fetch_all($result);

        mysqli_free_result($result);

        mysqli_close($conn);

        print_r($planning);

        // sql request to get the nom and creneaux attributes sorted by sport*/
        
?>

<html lang="en">
    <style>
        .row {
            display: grid;
            grid-template-columns: auto auto auto auto;
            grid-template-rows: 200px 200px;
            grid-gap: 10px;
            padding: 10px;
        }
    </style>
    <?php
        $conn = mysqli_connect("localhost", "root", "", "edt");
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $sql = 'SELECT nom, FORMAT (creneaux, "dd/MM/yyyy") as date, sport FROM planning ORDER BY sport';

        $result = mysqli_query($conn, $sql);

        $planning = mysqli_fetch_all($result);

        mysqli_free_result($result);

        mysqli_close($conn);
    ?>
    <div class="container">
        <div class="row">
            <?php foreach($planning as $rdv) { ?>
                <div>
                    <div>
                        <div>
                            <h3>
                                <!-- mettre en indice le numéro de colonne du sport (/!\ commence ) 0) -->
                                <?php echo htmlspecialchars($rdv['2']); ?>
                            </h3>
                            <div>
                                <!-- mettre en indice le numéro de colonne du coach (/!\ commence ) 0) -->
                                <?php echo htmlspecialchars($rdv['0']); ?>
                            </div>
                            <div>
                                <!-- mettre en indice le numéro de colonne du creneaux (/!\ commence ) 0) -->
                                <?php echo htmlspecialchars($rdv['1']); ?>
                            </div> 
                        </div>
                        <div>
                            <a href="#">book</a>
                            <br> <br>
                        </div>
                    </div>
                </div>
                <?php } 
            ?>
        </div>
    </div>
</html>
