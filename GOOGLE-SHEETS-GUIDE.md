# Google Sheets Setup Guide

This guide will help you set up your Google Sheet correctly for the Alumni Directory.

## Sheet Structure

### Sheet Name
Your sheet **must** be named `Summary` (case-sensitive).

### Column Layout

| Column | Header | Required | Description | Example |
|--------|--------|----------|-------------|---------|
| A | Batch | Yes | Graduation year or batch identifier | 2020, Class of 2019, Batch 2018 |
| B | Student Name | Yes | Full name of the alumnus | John Smith, Jane Doe |
| C | Country of Residence | Yes | Current country where alumni resides | United States, United Kingdom, India |
| D | Current Role | Yes | Current job title or position | Software Engineer, Product Manager |
| E | Role Function | No | Department or functional area | Engineering, Marketing, Operations |
| F | Organization | Yes | Current employer or organization | Google, Microsoft, Self-Employed |
| G | LinkedIn URL | No | Full LinkedIn profile URL | https://linkedin.com/in/johnsmith |

### Sample Data

Here's what your sheet should look like:

```
| Batch | Student Name    | Country        | Current Role        | Role Function | Organization | LinkedIn URL                          |
|-------|----------------|----------------|---------------------|---------------|--------------|---------------------------------------|
| 2020  | John Smith     | United States  | Software Engineer   | Engineering   | Google       | https://linkedin.com/in/johnsmith     |
| 2019  | Jane Doe       | United Kingdom | Product Manager     | Product       | Microsoft    | https://linkedin.com/in/janedoe       |
| 2021  | Ahmed Hassan   | United Arab Emirates | Data Scientist | Data Science  | Amazon       | https://linkedin.com/in/ahmedhassan   |
| 2018  | Maria Garcia   | Spain          | UX Designer         | Design        | Apple        | https://linkedin.com/in/mariagarcia   |
| 2020  | Li Wei         | China          | DevOps Engineer     | Engineering   | Alibaba      | https://linkedin.com/in/liwei         |
```

## Setup Instructions

### 1. Create a New Google Sheet

1. Go to [Google Sheets](https://sheets.google.com)
2. Click "Blank" to create a new spreadsheet
3. Rename it to something like "Alumni Directory Data"

### 2. Rename the Tab to "Summary"

1. Right-click on the tab at the bottom (usually says "Sheet1")
2. Select "Rename"
3. Type "Summary" (case-sensitive)
4. Press Enter

### 3. Add Column Headers

In Row 1, add the following headers:
- A1: Batch
- B1: Student Name
- C1: Country of Residence
- D1: Current Role
- E1: Role Function
- F1: Organization
- G1: LinkedIn URL

### 4. Format Your Sheet (Optional but Recommended)

#### Header Row Formatting
1. Select Row 1 (click on the row number)
2. Make it bold: **Format > Bold** or `Ctrl/Cmd + B`
3. Add background color: **Format > Fill color**
4. Freeze the row: **View > Freeze > 1 row**

#### Column Widths
Adjust column widths for readability:
- A (Batch): 80px
- B (Student Name): 150px
- C (Country): 150px
- D (Current Role): 180px
- E (Role Function): 120px
- F (Organization): 150px
- G (LinkedIn URL): 250px

#### Data Validation (Recommended)
Set up data validation to maintain consistency:

**For Batch Column:**
1. Select all cells in column A (except header)
2. Data > Data validation
3. Criteria: Text contains
4. Add your batch years (2015, 2016, etc.)

**For LinkedIn URLs:**
1. Select all cells in column G (except header)
2. Data > Data validation
3. Criteria: Custom formula
4. Formula: `=OR(ISBLANK(G2), REGEXMATCH(G2, "linkedin.com"))`

### 5. Add Your Alumni Data

Start adding alumni information from Row 2 onwards. Tips:
- Keep data consistent (e.g., always use "United States" not "USA" or "US")
- Use full LinkedIn URLs, not shortened links
- Leave cells empty if information is not available
- Use consistent naming for organizations (e.g., "Google" not "Google Inc.")

### 6. Share with Service Account

1. Click the "Share" button in the top-right
2. Paste your service account email (from your JSON credentials file)
   - It looks like: `your-service-account@project-id.iam.gserviceaccount.com`
3. Set permission to "Viewer" (read-only is sufficient)
4. Uncheck "Notify people" (the service account doesn't need notifications)
5. Click "Share" or "Send"

### 7. Get Your Sheet ID

The Sheet ID is in your Google Sheets URL:
```
https://docs.google.com/spreadsheets/d/[SHEET_ID]/edit
```

Copy the long string between `/d/` and `/edit` - this is your `GOOGLE_SHEET_ID`.

Example:
```
https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
```
Sheet ID: `1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms`

## Best Practices

### Data Entry
- **Consistency is key**: Use the same format for similar entries
- **Complete LinkedIn URLs**: Include `https://` at the start
- **Standardize country names**: Use full country names consistently
- **Regular updates**: Keep the sheet updated as alumni information changes

### Data Quality
- Remove duplicate entries
- Verify LinkedIn URLs are correct and active
- Use title case for names (John Smith, not JOHN SMITH)
- Keep organization names official (Microsoft, not MS)

### Security
- Only share with necessary people
- Use "Viewer" permission for the service account (never "Editor")
- Regularly audit who has access to your sheet
- Consider creating a backup copy

### Organization
- Sort by batch for easier maintenance
- Use filters to find and update specific entries
- Add a "Last Updated" column if tracking changes
- Consider using conditional formatting to highlight missing data

## Advanced Features

### Multiple Tabs
If you need to organize data across multiple tabs:
1. Keep the main "Summary" tab for the website
2. Create additional tabs for:
   - Pending approvals
   - Historical data
   - Contact information (private)

### Formulas for Data Cleanup
Use these formulas to maintain data quality:

**Standardize Country Names:**
```
=PROPER(TRIM(C2))
```

**Validate LinkedIn URLs:**
```
=IF(ISBLANK(G2),"",IF(REGEXMATCH(G2,"linkedin.com"),"Valid","Check URL"))
```

**Count Alumni by Batch:**
```
=COUNTIF(A:A,"2020")
```

### Bulk Import
If you have alumni data in CSV format:
1. File > Import
2. Upload your CSV file
3. Choose "Append to current sheet" or "Replace current sheet"
4. Map columns correctly

## Troubleshooting

### Website Not Showing Data
- Verify sheet is named "Summary" (exact spelling, case-sensitive)
- Check service account has access to the sheet
- Ensure Sheet ID in `.env` is correct
- Verify data starts from Row 2 (Row 1 is headers)

### LinkedIn Links Not Working
- Ensure URLs are complete: `https://linkedin.com/in/username`
- Remove any tracking parameters from URLs
- Test URLs manually before adding to sheet

### Special Characters Not Displaying
- Google Sheets handles UTF-8 by default
- If issues persist, check your database encoding
- Avoid using special characters in critical fields like batch numbers

### Slow Performance
- Keep sheet under 10,000 rows for optimal performance
- Remove unnecessary formulas and formatting
- Consider archiving old data to a separate sheet

## Sample Template

Download our sample template:
1. Make a copy of this sheet: [Sample Alumni Directory Template](https://docs.google.com/spreadsheets/d/YOUR_TEMPLATE_ID)
2. Customize with your data
3. Share with your service account
4. Copy the Sheet ID to your `.env` file

## Getting Help

If you need assistance:
1. Check that column order matches exactly
2. Verify service account permissions
3. Test Sheet API access using Google's [API Explorer](https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets.values/get)
4. Review application logs for specific errors

---

**Need more help?** Check the main [README.md](README.md) or open an issue on GitHub.
