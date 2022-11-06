state ("Pitfall")
{
    byte start:"Pitfall.exe", 0x52EB1;
    byte level:"Pitfall.exe", 0x51A2C;
    byte loading:"Pitfall.exe", 0x52D8B; // Loading time removal (also removes the time spent on the map screen in between levels) is commented out until it becomes an issue between PC, Sega CD, and 32x, as well as different PC configs.
}
start
{
    return (current.start != 0x00 && old.loading == 0x00 && current.loading == 0x01 && current.level == 0x0F);
}
split
{
    if (old.level == 0x00 && current.level == 0x13) return true;//Xibalba Falls
    if (old.level == 0x01 && current.level == 0x13) return true;//Tazamul Mines
    if (old.level == 0x02 && current.level == 0x13) return true;//Lost City of Copan
    if (old.level == 0x03 && current.level == 0x13) return true;//Copan Temple
    if (old.level == 0x04 && current.level == 0x13) return true;//Lakamul Rainforest
    if (old.level == 0x05 && current.level == 0x13) return true;//Yaxchilan Lagoon
    if (old.level == 0x06 && current.level == 0x13) return true;//Palenque Ruins
    if (old.level == 0x10 && current.level == 0x13) return true;//Tomb of Palenque
    if (settings["Autoscroller"] && old.level == 0x11 && current.level == 0x13) return true;//Balankanche Mine
    if (settings["Jaina_Island_Falls"] && old.level == 0x07 && current.level == 0x13) return true;//Jaina Island Falls
    if (old.level == 0x12 && current.level == 0x13) return true;//Tikal Ruins
    if (old.level == 0x08 && current.level == 0x13) return true;//Temple of Tikal
    if (old.level == 0x09 && current.level == 0x13) return true;//Warrior Spirit
    if (old.level == 0x0A && current.level == 0x16) return true;//Ending 
}
reset
{
    return (current.level == 0x15 || (current.level == 0x0F && current.loading == 0x00));
}
	// isLoading
	// {
	//     return (current.loading == 0x01 || current.level == 0x13);
	// }
startup
{
    refreshRate = 70;
    settings.Add("options", true, "Split before, after the minecart autoscroller, or both?");
    settings.Add("Autoscroller", true, "Tomb of Palenque -> Autoscroller", "options");
    settings.Add("Jaina_Island_Falls", true, "Autoscroller -> Jaina Island Falls", "options");
}
