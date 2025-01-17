# Connecting to the AWS MySQL Database Locally

## Introduction
The following steps can be taken to gain access to the AWS MySQL database locally.
Please be careful with this process as it will allow access to the database from your local machine.

## Steps

1. **Download the AWS PEM file**
    - The PEM file is required to connect to the AWS database.
    - The PEM file can be downloaded from the AWS console.
    - The PEM file should be stored in a secure location.

    This file is found by going to the `Secrets Manager` service in the AWS console.
    Click on the secret, and then click on the `Retrieve secret value` button.
    Create a file in a secure place on your computer named something like `itm220key.pem` and paste the contents of the secret value into that file.
    Make sure to include the `BEGIN RSA PRIVATE KEY` and `END RSA PRIVATE KEY` lines in the file.

2. **Change the permissions of the PEM file**
    - The permissions only need changed if you are natively using Mac or Linux.
    - The PEM file should only be readable by the owner.
    - This can be done by running the following command in the terminal:
    ```bash
    chmod 400 /path/to/itm220key.pem
    ```

3. **Connect to the AWS database**
    - You can connect to the AWS database using 2 different methods:
        - Using the MySQL Workbench application
        - Using the terminal

    - **Using MySQL Workbench**
        - Open MySQL Workbench.
        - Click on the `Database` tab.
        - Click on `Connect to Database`.
        - Change the connection method to `Standard TCP/IP over SSH`.
        - Fill in the following fields:
            - Connection Name: `AWS Database`
            - SSH Hostname: `YOURIPADDRESS:22`
            - SSH Username: `student`
            - SSH Key File: `/path/to/itm220key.pem`
            - MySQL Hostname: `127.0.0.1`
            - MySQL Server Port: `3306`
            - Username: `student`
        - Click on `Test Connection` to verify the connection. The password is `student`.
        - Click on `OK` to connect to the database.

    - **Using the terminal**
        - Open the terminal.
        Navigate to the folder where the PEM file is stored.
        - Run the following command:
        ```bash
        ssh -i itm220key.pem student@YOURIPADDRESS
        ```
        - Use the following command to connect to the database:
        ```bash
        mysql -u student -p
        ```
        - If you want to see the list of databases, run the following command:
        ```bash
        SHOW DATABASES;
        ```
        - If you want to connect to a specific database, run the following command:
        ```bash
        USE DATABASENAME;
        ```
        or when connecting to the database, you can use the following command:
        ```bash
        mysql -u student -p -D DATABASENAME
        ```