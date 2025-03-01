# Zumba-Game-in-Assembly-x86
# Overview

This repository contains a starter template for a 2D game inspired by Zumba, written in x86 Assembly (MASM). The code provides a structured framework with key functionalities, including menu handling, file interactions, and game screen definitions. While some core mechanics are not fully implemented, the template serves as a solid foundation for further development.

# Features

Menu System: ASCII-based menu display.

User Input Handling: Prompts for player name and file interactions.

File Handling: Reads and writes game data.

Memory Management: Uses buffers for user input storage.

Game Screen Definitions: Predefined sizes for different screens (Menu, Game, Name Entry).

# Requirements

To assemble and run this project, you need:

# Windows (MASM - Visual Studio)

-> Microsoft Visual Studio (with MASM installed)

-> Irvine32 Library (for Windows-based Assembly development)

-> MASM Compiler (ml.exe)

# Linux (NASM - DOSBox)

-> NASM assembler

-> DOSBox for running 16-bit programs

-> Suitable DOS-compatible linker (e.g., JWasm, ALINK)

# How to Build and Run

-> Windows (MASM)

-> Install Irvine32 Library and set up MASM in Visual Studio.

-> Open the Developer Command Prompt for VS.

-> Navigate to the project folder.

Compile using:

ml /c /coff Source.asm

Link the object file:

link /subsystem:console Source.obj Irvine32.lib

Run the executable:

Source.exe

# Linux (NASM + DOSBox)

Install NASM:

sudo apt install nasm dosbox

Assemble the file:

nasm -f obj Source.asm -o Source.obj

Link using DOS-compatible linker:

alink -oEXE Source.obj

Run inside DOSBox:

dosbox Source.exe

# Future Enhancements

-> Implement game logic for ball shooting mechanics.

-> Add collision detection for game elements.

-> Enhance graphics handling for smoother rendering.

-> Improve file handling to store and retrieve high scores.

# Contributions

Since this is a template, contributors are encouraged to build upon it, optimize performance, and add missing features. Feel free to fork and submit pull requests.

# License

This project is open-source so do consider innovating.
