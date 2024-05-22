# YOLO Web Application

## Description

This is a simple web application for managing products. Users can add, view, update, and delete products through a user-friendly interface.

## Requirements

Make sure that you have the following installed:

- Node.js
- npm
- MongoDB and start the mongodb service with `sudo service mongod start`

## Setup Instructions

1. **Clone the repository:**

    ```sh
    git@github.com:Allan-Kimutai/yolo.git
    ```

2. **Navigate to the client folder:**

    ```sh
    cd client
    ```

3. **Install dependencies:**

    ```sh
    npm install
    ```

4. **Start the client app:**

    ```sh
    npm start
    ```

5. **Open a new terminal and navigate to the backend folder:**

    ```sh
    cd ../backend
    ```

6. **Install backend dependencies:**

    ```sh
    npm install
    ```

7. **Start the backend server:**

    ```sh
    npm start
    ```

8. **Access the application at [http://localhost:3000](http://localhost:3000) in your web browser.**

### Stage One: Local Environment with Vagrant

1. **Navigate to the Stage_One directory:**

    ```sh
    cd yolo/Stage_One
    ```

2. **Start the Vagrant environment:**

    ```sh
    vagrant up
    ```

3. **Execute the Ansible playbook:**

    ```sh
    ansible-playbook -i inventory playbook.yml
    ```

### Stage Two: Cloud Environment with Terraform and Ansible

1. **Navigate to the Stage_Two/terraform directory:**

    ```sh
    cd yolo/Stage_Two/terraform
    ```

2. **Initialize Terraform:**

    ```sh
    terraform init
    ```

3. **Apply the Terraform configuration to provision AWS resources:**

    ```sh
    terraform apply
    ```

4. **Navigate to the Stage_Two/ansible directory:**

    ```sh
    cd ../ansible
    ```

5. **Execute the Ansible playbook:**

    ```sh
    ansible-playbook -i inventory playbook.yml
    ```

## Features

- Add new products with name, description, and price
- View a list of all products
- Update existing products
- Delete products

## Usage

- **Add a product:** Fill out the form with the product details and click "Add Product".
- **View products:** See the list of products displayed on the homepage.
- **Update a product:** Click on the "Edit" button next to a product and make changes in the form.
- **Delete a product:** Click on the "Delete" button next to a product to remove it from the list.

**Note:** The price field only accepts numeric input.

## Folder Structure
- **client/:** Contains the frontend code.
- **backend/:** Contains the backend code.
- **Stage_One/:** Contains Ansible playbooks and roles for local environment setup.
- **Stage_Two/:** Contains Terraform and Ansible configurations for cloud environment setup.


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License.
