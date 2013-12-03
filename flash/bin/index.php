<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<title>Daktari</title>
	<meta name="description" content="" />
	
	<script src="js/swfobject.js"></script>
	<script>
		var flashvars = {
		};
		var params = {
			menu: "false",
			scale: "noScale",
			allowFullscreen: "true",
			allowScriptAccess: "always",
			bgcolor: "",
			wmode: "direct" // can cause issues with FP settings & webcam
		};
		var attributes = {
			id:"Daktari"
		};
		swfobject.embedSWF(
			"Daktari.swf", 
			"altContent", "800px", "600px", "10.0.0", 
			"expressInstall.swf", 
			flashvars, params, attributes);
	</script>
	<style>
		html, body { height:100%; overflow:hidden;font-family: Arial;}
		body { display:table; min-width: 1024px}
                table {width:800px; font-size: 12px; vertical-align: top}
                h1 {font-weight: normal;}
                span {display:block;}
                #game {display: table-cell}
                #release_notes {display: table-cell; font-size: 12px; overflow: auto; min-width: 256px;}
                .title {font-weight: bold; font-size: 14px;}
                .date {font-size: 10px}
	</style>
</head>
<body>
    <div id="game">
    <h1><b>Daktari Msaidizi</b> Character control prototype</h1>
    <span>v0.02 : menu_implementation</span>
    
	<div id="altContent">
		<h1>Daktari</h1>
		<p><a href="http://www.adobe.com/go/getflashplayer">Get Adobe Flash player</a></p>
	</div>
    <table>
        <thead><tr><th>Controls:</th><th>Obstacles:</th></tr></thead>
        <tbody><tr><td>
        
                    <ul>
                        <li><b>Menu</b>
                        <ul>
                            <li>Arrow Keys: Control menu</li>
                            <li>Esc: Back</li>
                            <li>Enter: Select Item</li>
                        </ul></li>
                        <li><b>Game</b>
                        <ul>
                            <li>Arrow Keys: Control Character</li>
                            <li>CTRL(left): Jump</li>
                            <li>P: Pause</li>
                            <li>Enter: Continue</li>
                            
                        </ul></li>
                    </ul>
                    
                </td><td>
                    
                    <ul>
                        <li>Blue: Climbable</li>
                        <li>Grey: Platform (Solid)</li>
                    </ul>
                    
                </td></tr>
        </tbody>
    </table>
    </div>
    <div id="release_notes">
        <?php include_once 'release_notes.html' ?>
    </div>
</body>
</html>