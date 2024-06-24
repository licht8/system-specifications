#pragma once

class FileReader {
private:
    std::string filename;  

public:
    FileReader(const std::string& filename) : filename(filename) {}

    void readFileAndPrint() {
        std::ifstream inputFile(filename);

        if (!inputFile.is_open()) {
            std::cerr << "Can't read the file :( " << filename << std::endl;
            return;
        }

        std::string line;

        while (std::getline(inputFile, line)) {
            SetConsoleColor(FOREGROUND_GREEN);
            std::cout << line << std::endl;
        }

        inputFile.close();
    }
};
