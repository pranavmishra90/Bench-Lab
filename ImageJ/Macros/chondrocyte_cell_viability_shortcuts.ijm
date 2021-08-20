macro "One [n1]" {
    run("Duplicate...", " ");
    run("8-bit");
    run("Grays");
    run("Subtract Background...", "rolling=50");
    wait(1000)
    //run("Threshold...");
    //setThreshold(0, 41);
    setOption("BlackBackground", false);
    run("Convert to Mask");
    wait(1000)
    run("Watershed");
    wait(1000)
    run("Analyze Particles...", "size=20-800 circularity=.2-1.00 show=Overlay exclude summarize");
    wait(250)
    close();
    run("Main Window [enter]");
    wait(100)
    run("Open Next");
}

macro "One [n+]" {
    
    run("Duplicate...", " ");
    run("8-bit");
    run("Grays");
    run("Subtract Background...", "rolling=50");
    wait(1000)
    //run("Threshold...");
    //setThreshold(0, 20);
    setOption("BlackBackground", false);
    run("Convert to Mask");
    wait(1000)
    run("Watershed");
    wait(1000)
    run("Analyze Particles...", "size=10-800 circularity=.3-1.00 show=Overlay exclude summarize");
    wait(250)
    close();
    run("Main Window [enter]");
    wait(100)
    run("Open Next");
}

 macro "Two [n2]" {

    run("Duplicate...", " ");
    setBackgroundColor(0, 0, 0);
    run("Clear Outside");
    run("Split Channels");

    close();
    run("8-bit");
    run("Grays");
    run("Subtract Background...", "rolling=50");
    wait(2000)
    //run("Threshold...");
    //setThreshold(0, 41);
    setOption("BlackBackground", false);
    run("Convert to Mask");
    wait(2000)
    run("Watershed");
    wait(1000)
    run("Analyze Particles...", "size=20-400 circularity=0.2-1.00 show=Overlay exclude summarize");
    wait(2000)
    close();

    run("8-bit");
    run("Grays");
    run("Subtract Background...", "rolling=50");
    wait(2000)
    //run("Threshold...");
    //setThreshold(0, 20);
    setOption("BlackBackground", false);
    run("Convert to Mask");
    wait(2000)
    run("Watershed");
    wait(1000)
    run("Analyze Particles...", "size=30-400 circularity=0.2-1.00 show=Overlay exclude summarize");

}

macro "Install [n0]" {

    run("Install...", "install=[C:/Users/pmish/OneDrive - rush.edu/Programming/Bench-Lab/ImageJ/Macros/chondrocyte_cell_viability_shortcuts.ijm]");

}