<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Creation Using Excel</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f4f4; }
        .container { max-width: 800px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1, h2 { color: #333; }
        pre { background: #eee; padding: 10px; border-radius: 5px; overflow-x: auto; }
        .code { background: #282c34; color: #61dafb; padding: 10px; border-radius: 5px; overflow-x: auto; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Staff Creation Using Excel</h1>
        <p>This document provides instructions for creating and uploading staff details using an Excel file.</p>

        <h2>Steps to Create Staff Using Excel</h2>
        <ul>
            <li><strong>Prepare the Excel File:</strong> Ensure the file is in <code>.xlsx</code> format.</li>
            <li><strong>Upload the Excel File:</strong> Navigate to the staff management section and upload the file.</li>
            <li><strong>Validate and Import Data:</strong> The system will validate and show errors if any exist.</li>
            <li><strong>Verify the Data:</strong> Check the staff list to ensure correctness.</li>
        </ul>

        <h2>API Upload (cURL)</h2>
        <pre class="code">curl --location 'http://localhost:30094/api/v1/upload' \
--form 'file=@"/path/to/file"'</pre>

        <p>Replace <code>"/path/to/file"</code> with the actual path to your Excel file.</p>

        <p>For any issues, refer to the error log or contact support.</p>
    </div>
</body>
</html>
