game_save("Testsave.ini");


ini_open("game_settings.ini"); //ini_open(string) where string is the file name (must be *.ini) 
ini_write_real("Settings","Volume",0.8); //ini_write_real(section,key,value) 
ini_write_string("Settings","Mute","false"); //ini_write_string(section,key,value) 
ini_write_real("Settings","RoomSpeed",60); 
ini_write_string("Settings","AutoSave","false");

ini_write_string("Colors","Random","editor");

ini_write_string("BuildTexture","rgb","0,0,0"); 
ini_write_string("BuildTexture","shg","0,0,0,1"); 
ini_write_string("BuildTexture","builder","true");

ini_close(); //Closes the current open ini file. Be sure to do this!

ini_open("game_settings.ini"); 
Volume = ini_read_real("Settings","Volume",0); //ini_read_real(section,key,default)
Mute = ini_read_string("Settings","Mute","true"); //ini_read_string(section,key,default) 
room_speed = ini_read_real("Settings","RoomSpeed",30); 
auto_save = ini_read_string("Settings","AutoSave","true"); 

CustomColors = ini_read_string("Colors","Random","Player"); 

BuildTextures = ini_read_string("BuildTexture","rgb","false"); 
ini_close();


if file_exists("color.cl")
{
    var LoadFile = file_text_open_read("color.cl");
    var LoadedRoom = file_text_read_real(LoadFile);
    show_debug_message(LoadFile && LoadedRoom)
    file_text_close(LoadFile);
}
else
{
game_save("color.cl");
}
