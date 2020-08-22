<!DOCTYPE html>
<html>
  <head><title>Test Page</title></head>
  <body>
    <div>
      <h2>Server variables:</h2>
      <p><?php print('<pre>'.print_r($_SERVER, true).'</pre>'); ?></p>
    </div>
    <div>
      <h2>PHP info:</h2>
      <p><?php echo phpinfo(); ?></p>
    </div>
  </body>
</html>
