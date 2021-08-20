// Cell Viablity Counter
// Live-Dead histological analysis

requires("1.33s"); 
dir = getDirectory("Choose a Directory ");
setBatchMode(true);
count = 0;
countFiles(dir);
n = 0;
processFiles(dir);
saveAs("Results", dir+"/Summary.csv");
print(count+" files processed");

function countFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            countFiles(""+dir+list[i]);
        else
            count++;
    }
}

function processFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            processFiles(""+dir+list[i]);
        else {
            showProgress(n++, count);
            path = dir+list[i];
            processFile(path);
        }
    }
}

function processFile(path) {
    if (endsWith(path, "live.tif")) {
        open(path);
        wait(1000);
        run("Duplicate...", " ");
        run("8-bit");
        run("Grays");
        run("Subtract Background...", "rolling=50");
        wait(1000);
        //run("Threshold...");
        //setThreshold(0, 41);
        setOption("BlackBackground", false);
        run("Convert to Mask");
        wait(1000);
        run("Watershed");
        wait(1000);
        run("Analyze Particles...", "size=20-800 circularity=.2-1.00 show=Overlay exclude summarize");
        wait(250);
    }

    if (endsWith(path, "dead.tif")) {
        open(path);
        run("8-bit");
        run("Grays");
        run("Subtract Background...", "rolling=50");
        wait(1000);
        //run("Threshold...");
        //setThreshold(0, 20);
        setOption("BlackBackground", false);
        run("Convert to Mask");
        wait(1000);
        run("Watershed");
        wait(1000);
        run("Analyze Particles...", "size=10-800 circularity=.3-1.00 show=Overlay exclude summarize");
        wait(250);
    }

}