This is a small environment I use to generate a resume.

The idea is to have an HTML layout (that I created tahnks to bootsrap) and  a JSON file.

The JSON file contains the information to put in the layout.

I then launch the generate_html.rb script to generate the HTML and open it in Chromium.

I can now print the HTML page into a PDF and voilà, I have a nice PDF resume.

Feel free to use this for your personal usage.

Once phanjtomjs manage to handle flexbox properties correctly, it might be a nice idea to use it to automatize the PDF generation instead of using chromium each time a new resume is edited.

Required gems for the ruby script: tilt 