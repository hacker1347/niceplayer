#include <iostream>
#include <Windows.h>
#include <mmsystem.h>

#pragma comment(lib, "Winmm.lib")

int main()
{
    std::string songPath = "C:/path/to/Xcho-Ty-i-Ya(TikTok Remix).mp3";

    std::cout << "Music Player" << std::endl;
    std::cout << "Press '1' to play the song" << std::endl;
    std::cout << "Press '2' to stop the song" << std::endl;
    std::cout << "Press '3' to exit the program" << std::endl;

    char choice;
    bool isPlaying = false;

    while (true)
    {
        std::cin >> choice;

        switch (choice)
        {
        case '1':
            if (!isPlaying)
            {
                mciSendString(("open \"" + songPath + "\" type mpegvideo alias mp3").c_str(), NULL, 0, NULL);
                mciSendString("play mp3", NULL, 0, NULL);
                isPlaying = true;
                std::cout << "Playing the song..." << std::endl;
            }
            else
            {
                std::cout << "The song is already playing." << std::endl;
            }
            break;

        case '2':
            if (isPlaying)
            {
                mciSendString("stop mp3", NULL, 0, NULL);
                mciSendString("close mp3", NULL, 0, NULL);
                isPlaying = false;
                std::cout << "Stopped the song." << std::endl;
            }
            else
            {
                std::cout << "No song is playing." << std::endl;
            }
            break;

        case '3':
            if (isPlaying)
            {
                mciSendString("stop mp3", NULL, 0, NULL);
                mciSendString("close mp3", NULL, 0, NULL);
            }
            std::cout << "Exiting the program..." << std::endl;
            return 0;

        default:
            std::cout << "Invalid choice. Try again." << std::endl;
            break;
        }
    }

    return 0;
}
