Staff Creation Using Excel
Overview
This document provides instructions for creating and uploading staff details using an Excel file. The process enables bulk staff entry by formatting the data correctly and importing it into the system.

Steps to Create Staff Using Excel
1. Prepare the Excel File
Ensure the file is in .xlsx format.
Follow the sample Excel file provided to maintain the correct structure and data format.
Avoid modifying column names or their order to ensure a smooth import process.
2. Upload the Excel File
Navigate to the staff management section in the system.
Select the option to upload an Excel file.
Choose the prepared file and upload it.
3. Validate and Import Data
After uploading, the system will validate the data.
Any errors in the file will be displayed for correction.
Once validated, confirm the import to create staff records.
4. Verify the Data
Check the staff list to ensure all entries are correctly imported.
If any data is missing or incorrect, re-upload a corrected file.
5. API Upload (cURL)
You can also upload the Excel file via an API using cURL:

sh
Copy
Edit
curl --location 'http://localhost:30094/api/v1/upload' \
--form 'file=@"/path/to/file"'
Replace "/path/to/file" with the actual path to your Excel file.
