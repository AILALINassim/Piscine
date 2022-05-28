<?php
    session_start();
    // get the ID_Client in the session

    /* A MODIFIER POUR QUE CA SOIT GENERIQUE */
    $ID_Client = 'azertyuiop';
    //mettre id client dans form avec input hidden
    //mettre ça ligne 28 : $ID_Client = $_POST['ID_Client'];
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
        $conn = mysqli_connect("localhost", "root", "", "omnes");

        if(isset($_POST['submit-button'])) {
            // get the ID_Reservation when we click the corresponding button
            $ID_Reservation = $_POST['myIDReservation'];
            //$ID_Client = $_POST['ID_Client'];
            // sql request to set the ID_Reservation with ID_Reservation in the client table
            $sql = "UPDATE client SET ID_Reservation = '$ID_Reservation' WHERE ID_Client = '$ID_Client'";
            // apply the request
            $conn->query($sql);
        }

        mysqli_close($conn);
    ?>

    <?php
        $conn = mysqli_connect("localhost", "root", "", "omnes");
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        // sql request to get the date, heure and prix attributes from reservation and associated coach with the id_coach
        $sql = 'SELECT date, heure, prix, coach.prenom, coach.nom, coach.activite, ID_Reservation FROM reservation, coach WHERE reservation.ID_Coach = coach.ID_Coach ORDER BY date';
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
                                <?php echo htmlspecialchars($rdv['5']); ?>
                            </h3>
                            <h4>
                                <!-- mettre en indice le numéro de colonne du sport (/!\ commence ) 0) -->
                                <?php   echo htmlspecialchars($rdv['3']);
                                        echo " ";
                                        echo htmlspecialchars($rdv['4']); ?>
                            </h4>
                            <p>
                                <!-- mettre en indice le numéro de colonne du coach (/!\ commence ) 0) -->
                                <?php echo htmlspecialchars($rdv['0']); ?>
                                <!-- mettre en indice le numéro de colonne du creneaux (/!\ commence ) 0) -->
                                <?php echo htmlspecialchars($rdv['1']); ?>
                                <br>
                                <?php   echo htmlspecialchars($rdv['2']); 
                                        echo "€"
                                ?>
                            </p> 
                        </div>
                        <div>
                            <form action="test.php" method="post" enctype="multipart/form-data">
                                <?php
                                    echo "<input type='hidden' value='$rdv[6]' name='myIDReservation'>";
                                ?>
                                <button type="submmit" name="submit-button">
                                    Réserver
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <?php } 
            ?>
        </div>
    </div>
</html>
