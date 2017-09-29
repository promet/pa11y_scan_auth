# pa11y_scan_auth

[WIP] Scann Pa11y sites with session-based authentication

# Instructions

- Install the following gem:

* gem install nokogiri
* gem install mechanize - http://docs.seattlerb.org/mechanize/

- Create a site directory within the root (This is where the scraped pages and pa11y results will be stored)

- To execute:

```
ruby auth_script.rb
```

# Configuration

Some modification of the script is needed.
Most of the sites has different login form field elements, if the field provided didn't work, you need to do some inspect element and get the correct field name.

Use your favorite editor to edit the file auth_script.rb.

### URL of the login page

Example:

login = agent.get('https://drupal.org/user/login').form

### Provide login username

Example:

login.field.value = "nathanjo"

### Provide login password

Example:

login.pass = "YOUR_PASSWORD"