## Tennis players scraping 
Requirements for the resultant lists include:

1) Records should list data in the following order:
LastName, FirstName, Gender, DateOfBirth, FavoriteColor

2) List should be output 3 times:
- Output 1 - sorted by Gender (Females before Males) then LastName ascending.
- Output 2 - sorted by Date, ascending.
- Output 3 - sorted by last name, descending.
- The expected output can be in: output.txt

3) Dates need to be displayed as ##/##/####

4) It is safe to assume that there are never any separators (commas, pipes, spaces, dashes) in any of the
data, besides the separators themselves.

5) Please use only the standard libraries only. No outside libraries (eg. SQL, etc) are allowed.

#### Running the program:
1. Extract files to the location where you want the `tennis_scraping` to be extracted
2. Open terminal
3. Change the current working directory to the extracted `tennis_scraping` directory
4. Type `ruby runner.rb` in terminal
5. Output file is at: `/your/path/tennis_scraping/output_file.txt`