# Xcrypt


Xcrypt is a simple, secure, and efficient Bash utility designed to provide AES-256 encryption for raw partitions on Arch Linux. With Xcrypt, you can encrypt, mount, and manage encrypted partitions, ensuring your sensitive data is protected at the highest security standards.

**Description**

Xcrypt is a user-friendly script built for Linux enthusiasts, who value data privacy and security. Leveraging the power of AES-256 encryption, Xcrypt encrypts raw partitions byte-by-byte, making them accessible only through a secure passphrase. With an intuitive menu-driven interface, Xcrypt allows you to:

1. Mount partitions.
2. Encrypt partitions with AES-256 encryption.
3. Unmount partitions securely.

Whether you're securing a personal drive or setting up encrypted storage for sensitive data, Xcrypt is designed to keep your data safe from unauthorized access.

1. Table of Contents
2. Installation
3. Usage
4. Features
5. Security Considerations
6. Tests

**Installation**

Follow these steps to install and set up Xcrypt:

1. Download Xcrypt: Clone the repository or download the xcrypt.sh file directly: git clone https://github.com/your-repo/Xcrypt.git
2. Navigate to the directory: cd Xcrypt
3. Make the script executable: chmod +x xcrypt.sh
4. Run the script: ./xcrypt.sh

**Note:** 

Ensure that your system has cryptsetup installed and you have sudo privileges.

**Usage**

1. Open your terminal and navigate to the directory containing xcrypt.sh.
2. Run the script: ./xcrypt.sh
3. Choose one of the following options from the interactive menu:
4. View detected partitions.
5. Mount a partition.
6. Encrypt a partition with AES-256 encryption.
7. Unmount the partition.

Xcrypt will guide you through each operation with prompts for input.

**Features**

**AES-256 Encryption:**

Encrypts raw partitions securely at the block level using the aes-xts-plain64 cipher.

**Partition Management:**

Easy options to mount or unmount partitions.

**Menu-Driven Interface:**

Simplifies complex operations with clear prompts and intuitive workflows.

**Password Guidance:**

Encourages users to set strong, secure passwords for encryption.

**Security Considerations**

Xcrypt is designed with security in mind. Here are some best practices.

**Strong Passwords:**

Use a passphrase with at least 16 characters, combining uppercase and lowercase letters, numbers, and symbols.

**Backup Important Data:**

Encrypting a partition will erase all existing data. Ensure you back up any important files before proceeding.

**Auditing and Logs:**

Consider maintaining a log of operations for accountability and troubleshooting.

**Warning:**

Use Xcrypt at your own risk. The developer is not responsible for data loss, system failures, or other unintended consequences. Ensure you understand the encryption process before proceeding.

**Tests**

Xcrypt has been tested across various Arch Linux environments for the following functionalities:

• Successfully encrypting partitions with AES-256 encryption.
• Mounting and unmounting encrypted partitions securely.
• Error handling for invalid devices, weak passwords, or missing dependencies.

**Legal Disclaimer**

The Xcrypt program is provided "as is" without any guarantees or warranties, express or implied. By using this program, you agree to the following terms:

**No Liability:**

The developer of Xcrypt shall not be held liable for any damages, data loss, system failures, or other consequences resulting from the use, misuse, or inability to use this software. This includes, but is not limited to, incidental, special, indirect, or consequential damages.

**No Responsibility for Data Loss:**

The encryption process involves modifying raw partitions, which may result in the erasure of all data on the targeted device. It is the user's responsibility to back up all critical data before using Xcrypt. The developer is not responsible for any data loss incurred.

**User Responsibility:**

By using Xcrypt, you acknowledge that you understand the risks associated with partition encryption, including the possibility of permanent data loss or system malfunction. You also agree that you have read and understood the documentation provided and have taken appropriate precautions before running the program.

**No Support Guarantee:**

The developer is under no obligation to provide support, updates, or bug fixes for Xcrypt. The software is released as a free and open-source tool for use at your own discretion.

**Compliance with Local Laws:**

It is the user's responsibility to ensure that the use of encryption software complies with all applicable laws and regulations in their jurisdiction. The developer assumes no liability for legal repercussions arising from the use of Xcrypt.

**Security Risks:**

While Xcrypt employs AES-256 encryption to secure data, no system can be guaranteed to be 100% secure. The developer does not guarantee protection against unauthorized access, hacking, or other security breaches. By using Xcrypt, you agree to indemnify and hold harmless the developer from any claims, liabilities, or damages arising from your use of the program.
