# NewWinPCSctipts
A collection of scripts to run on a new PC to aid in setup

The NewWinPCInstall.ps1 is a script designed to install Chocolaty and a range of packages to get a new PC up and running. Simply open powershell as Admin, browse to the file location and run:

Download file to C: or another suitable location Open Powershell as Administrator
* Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
* powershell -ExecutionPolicy Bypass -File C:\NewWinPCInstall.ps1

First the powershell script will install Chocolaty 
Chocolaty is a package manager and will manage and install all the applications listed below: 

The following packages have been included: 

* **7zip:**
7zip is a free and open-source file archiver with a high compression ratio, supporting various archive formats including 7z, ZIP, RAR, and more. It's widely used for compressing and decompressing files, offering strong encryption and integration with the Windows shell.

* **adobereader:**
Adobe Reader is a free software application that allows users to view, print, and annotate PDF documents. It is the industry standard for PDF viewing, providing a comprehensive set of tools for interacting with PDF files.

* **advanced-ip-scanner:**
Advanced IP Scanner is a free network scanner that allows users to analyze local networks, identify active devices, and retrieve information such as IP addresses, MAC addresses, and hostnames. It simplifies network management and troubleshooting.

* **apimonitor:**
API Monitor is a powerful tool for monitoring and displaying API calls made by applications. It allows developers to track and analyze how applications interact with Windows APIs, aiding in debugging and reverse engineering.

* **azure-cli:**
The Azure CLI is a command-line tool that allows users to manage Azure resources from the command prompt. It provides a flexible and efficient way to automate Azure tasks and manage cloud infrastructure.

* **bleachbit:**
BleachBit is a free and open-source system cleaner that helps users free up disk space and protect privacy by deleting unnecessary files, cache, cookies, and other temporary data.

* **chocolatey:**
Chocolatey is a package manager for Windows that allows users to install, update, and manage software from the command line. It simplifies software installation and automates the process of keeping applications up to date.

* **cpu-z:**
CPU-Z is a free utility that provides detailed information about a computer's CPU, motherboard, RAM, and other hardware components. It's a popular tool for monitoring system specifications and performance.

* **curl:**
Curl is a command-line tool for transferring data with URLs, supporting various protocols such as HTTP, HTTPS, FTP, and more. It's commonly used for downloading files, testing APIs, and scripting web interactions.

* **discord:**
Discord is a voice, video, and text communication service used by millions of people for connecting with friends and communities. It offers features like servers, channels, and screen sharing, making it a popular platform for gaming and social interaction.

* **ditto:**
Ditto is an extension to the standard Windows clipboard, allowing users to save multiple clipboard items and access them later. It enhances productivity by providing a history of copied items.

* **docker-desktop:**
Docker Desktop is an application that allows users to build, share, and run containerized applications on Windows. It simplifies the process of developing and deploying applications using Docker containers.

* **everything:**
Everything is a desktop search engine for Windows that quickly locates files and folders by filename. It's known for its speed and efficiency in searching large amounts of data.

* **expresso:**
Expresso is a regular expression development tool that helps users build and test regular expressions. It provides a visual interface and a library of common regular expressions.

* **file-converter:**
File Converter is a tool that allows users to convert various file formats, including images, audio, video, and documents. It simplifies file format conversion with a user-friendly interface.

* **filezilla:**
FileZilla is a free and open-source FTP client that allows users to transfer files between their computer and a remote server. It supports FTP, SFTP, and FTPS protocols.

* **fiddler:**
Fiddler is a web debugging proxy that captures and analyzes HTTP/HTTPS traffic between a computer and the internet. It's a powerful tool for web developers and security researchers.

* **firefox:**
Firefox is a free and open-source web browser developed by Mozilla. It's known for its privacy features, customization options, and support for web standards.

* **git:**
Git is a free and open-source distributed version control system used for tracking changes in computer files and coordinating work among teams. It's widely used in software development.

* **gnupg:**
GnuPG (GNU Privacy Guard) is a free software implementation of the OpenPGP standard used for encrypting and signing data and communications. It's commonly used for email encryption and digital signatures.

* **gpg4win:**
Gpg4win (GNU Privacy Guard for Windows) is a suite of tools that provide encryption and digital signature capabilities for Windows users. It includes tools for managing keys and encrypting files and emails.

* **greenshot:**
Greenshot is a lightweight screenshot tool for Windows that allows users to capture, annotate, and share screenshots. It offers various capture modes and editing features.

* **hwinfo:**
HWiNFO is a hardware information and diagnostic tool for Windows that provides detailed information about a computer's hardware components and monitors system sensors.

* **irfanview:**
IrfanView is a free and fast image viewer and editor for Windows that supports various image formats. It's known for its small size and efficient performance.

* **jdownloader:**
JDownloader is a free and open-source download manager that simplifies the process of downloading files from various websites. It supports multiple downloads, automatic extraction, and link decryption.

* **jetbrainstoolbox:**
JetBrains Toolbox App is a control panel for JetBrains developer tools, allowing users to manage and update their JetBrains IDEs.

* **kate:**
Kate is a powerful text editor developed by the KDE community, offering advanced features like syntax highlighting, code folding, and plugin support.

* **kodi:**
Kodi is a free and open-source media player software application that allows users to play and stream various media files, including videos, music, and photos.

* **mremoteng:**
mRemoteNG is a multi-protocol remote connections manager. It allows to view all of your remote connections in one simple but powerful tabbed interface.

* **nmap:**
Nmap (Network Mapper) is a free and open-source network scanner used for network discovery and security auditing. It allows users to scan networks for open ports, services, and vulnerabilities.

* **notepadplusplus:**
Notepad++ is a free and open-source text and source code editor for Windows that supports various programming languages. It's known for its speed, efficiency, and plugin support.

* **nugetpackageexplorer:**
NuGet Package Explorer is a free and open-source tool for exploring and creating NuGet packages. It allows users to view package contents and metadata.

* **office365business:**
Microsoft 365 Business is a subscription service that provides access to Microsoft Office applications and cloud-based services for businesses.

* **obs-virtualcam:**
OBS VirtualCam is a plugin for OBS Studio that allows users to use OBS as a virtual webcam in other applications. It enables users to stream or record video from OBS in applications like Zoom and Skype.

* **obsidian:**
Obsidian is a powerful knowledge base and note-taking app that works on top of a local folder of plain text Markdown files.

* **openvpn-connect:**
OpenVPN Connect is the official VPN client for OpenVPN, allowing users to connect to OpenVPN servers and establish secure connections.

* **plasso:**
Plasso is a web-based platform for creating and managing online courses and memberships.

* **postman:**
Postman is an API platform for building and using APIs. It simplifies API development and testing with a user-friendly interface and various tools.

* **powertoys:**
Microsoft PowerToys is a set of utilities for power users to fine-tune and streamline their Windows experience for greater productivity.

* **protonmail:**
ProtonMail is an end-to-end encrypted email service that prioritizes user privacy and security.

* **protonvpn:**
ProtonVPN is a virtual private network (VPN) service that encrypts internet traffic and protects user privacy.

* **putty.install:**
PuTTY is a free SSH, Telnet, and Rlogin client for Windows, allowing users to connect to remote servers.

* **raidrive:**
RaiDrive is a tool that maps cloud storage services as network drives, allowing users to access cloud files as if they were local files.

* **revo-uninstaller:**
Revo Uninstaller is a utility that helps users uninstall software from Windows, including leftover files and registry entries.

* **servicebusexplorer:**
Service Bus Explorer is a tool for managing and exploring Azure Service Bus queues, topics, and subscriptions.

* **sidebar-diagnostics:**
Sidebar Diagnostics is a tool that displays system information and performance metrics in a sidebar on the Windows desktop.

* **spotify:**
Spotify is a digital music streaming service that provides access to millions of songs, podcasts, and videos.

* **start11:**
Start11 is a utility that allows users to customize the Windows Start menu and taskbar, offering various customization options.

* **streamio:**
Stremio is a modern media center that allows you to watch movies, TV shows, YouTube, and more.

* **sumatrapdf:**
SumatraPDF is a free and lightweight PDF, eBook (ePub, Mobi), XPS, DjVu, CHM, and comic book (CBZ and CBR) reader for Windows.

* **tailscale:**
Tailscale is a VPN service that creates a secure network between your devices, allowing you to access them from anywhere.

* **tapwindows:**
TAP-Windows Adapter is a virtual network
