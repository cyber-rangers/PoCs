<!DOCTYPE html>
<html>
<body>

<img src="/uploads/atomone.GIF" name="atomone">
<form action="./upload.php" method="post" enctype="multipart/form-data">
  Vyber obrazek k upload:
  <input type="file" name="fileToUpload" id="fileToUpload">
  <input type="submit" value="Upload Image" name="submit">
</form>

<?php
/**
* Get the filename from a GET input
* Example - http://example.com/?file=filename.php
*/
$file = $_GET['file'];

/**
* Unsafely include the file
* Example - filename.php
*/
include('directory/' . $file);
?>


</body>
</html>