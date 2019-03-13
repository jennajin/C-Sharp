# Study Notes

## Overview

- Each page includes same header and footer.
- Validation: server side & client side
- Database: MSSQL
  - four tables: user, note, category, feedback

## Pages

1. [Home Page](#Home)
2. [Information Page](#Information)
3. [Feedback Form Page](#Feedback)
   - Confirmation of Feedback form Page
4. [Register Page](#Register)
   - Account Page
5. [Login Page](#Login)
   - Successful Login Page
6. [Browse Page](#Browse)
   - Edit Note Page
   - Delete Note Page
7. [Master Page](#Master)
8. [Other](#Other)

### Home

Default page (main page).
It contains basic information about the product.

### Information

It contains information about the product.

### Feedback

This form includes text boxes, a text area, check box, and submit button.
When user clicks the submit button, it transfers to the confirmation page.

### Register

It allows users to register to this website. Passwords must be stored using a hashing mechanism.
Client-side validation is processed for checking the values in form's input fields conform to certain expectations.

### Login

Username and password must match with database values.
If login validation is successful, a success message is displayed in the Successful Login Page.

### Browse

Study note page.
It contains CRUD (Craete, Read, Update, Delete) operations.

### Master

A template for other pages.
It allows a consistent look and behavior for all the pages.

### Other

This product includes JavaScript, CSS, and Bootstrap elements.
