# Inventory Management

This is a take-home project given by Swipe.

## Objectives

### Listing Product Screen

- Develop a screen that displays a list of products
- User should be able to do the following things on the screen:
  - Search products
  - Look for all the products
  - Scroll through the list
- Include a button that allows the user to navigate to the Add Product screen.
- Ensure that images are loaded for each product from a URL. If the URL is empty, use a default image instead.
- Populate all required fields, such as product name, product type, price, and tax, for each product in the list.
- Provide a visual indicator, such as a progress bar, to show loading progress.
- Use the provided API endpoint and HTTP method to retrieve the product data.

### Add Product Screen

- Select the product type from a list of options.
- Enter the product name, selling price, and tax rate using text fields.
- Optionally select images in JPEG or PNG format with a 1:1 ratio.
- Validate fields such as product type selection, non-empty product name, and decimal numbers for selling price and tax.
- Submit the data using the POST method to the API endpoint.
- Use a user-friendly interface to display the screen.
- Document the code for future reference.
- Provide clear and concise feedback to the user upon completion of the action.

### API Endpoints

- GET: https://app.getswipe.in/api/public/get
- POST: https://app.getswipe.in/api/public/add

## Features

- [x] Displays a list of products
- [x] Search products
- [x] Navigate to the Add Product screen
- [x] Display product images if available, or show a default image
- [x] Progress bar to show loading progress
- [ ] Share product button
- [ ] Filter product list based on availability (logic)
- [x] Select the product type from a list of options when adding
- [x] Text Field Validation
- [x] Uplaod Product with optional Photo to API
- [x] Completion alerts

## MVVM
 <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/MVVM.jpg" width="500" height="500">

 ## Screenshots

| Product List | Search Product | Product Detail | Selector |
|---|---|---|---|
| <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/productlist.png" width="200" height="400"> | <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/search.png" width="200" height="400"> | <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/productdetail.png" width="200" height="400"> | https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/selector.mov |

| Add Product | Add Example | Example Price | Add Alert |
|---|---|---|---|
| <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/addproduct.png" width="200" height="400"> | <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/addproductex.png" width="200" height="400"> | <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/addproductextax.png" width="200" height="400"> | <img src="https://github.com/krishmittal21/InventoryManagement/blob/main/Documentation/Screenshots/alert.png" width="200" height="400"> | 

## Installation

1. Clone the repository
2. Start the development

## Contributing

Contributions are welcome! 

## License

This project is licensed under the [MIT License](LICENSE).
