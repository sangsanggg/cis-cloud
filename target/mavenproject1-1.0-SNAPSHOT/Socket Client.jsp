<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Socket Client</title>
</head>
<body>
	<h1>Socket Client</h1>
	<form>
		<label for="file">Select a Docker image file to upload:</label><br>
		<input type="file" id="file" name="file"><br>
		<input type="button" value="Send" onclick="sendFile()">
	</form>
	<script>
		function sendFile() {
			// Get the file input element
			var fileInput = document.getElementById("file");

			// Get the selected file
			var file = fileInput.files[0];

			// Create a Socket object
			var socket = new Socket("localhost", 8888);
			var out = new PrintWriter(socket.getOutputStream(), true);
			var in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

			// Send the file name to the server
			out.println(file.name);

			// Open the file to read
			var fis = new FileInputStream(file);

			// Read the file contents and send them to the server
			var ch;
			while ((ch = fis.read()) != -1) {
				out.write(ch);
			}

			// Close the file
			fis.close();

			// Read the response from the server
			alert(in.readLine());
		}
	</script>
</body>
</html>
