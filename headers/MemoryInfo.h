#pragma once

class MemoryInfo {
public:
    MemoryInfo() {
        memoryStatus.dwLength = sizeof(memoryStatus);
        GlobalMemoryStatusEx(&memoryStatus);
    }

    void printMemoryInfo() const {
        SetConsoleColor(FOREGROUND_GREEN);
        std::cout << "\nMemory Information:\n";
        SetConsoleColor(FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE);
        std::cout << "  Total Physical Memory: " << memoryStatus.ullTotalPhys / (1024 * 1024) << " MB\n";
        std::cout << "  Available Physical Memory: " << memoryStatus.ullAvailPhys / (1024 * 1024) << " MB\n";
    }

private:
    MEMORYSTATUSEX memoryStatus; 
};
