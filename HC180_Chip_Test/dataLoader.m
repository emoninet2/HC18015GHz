
function fileData = dataLoader()


    clear all
    allFiles = dir;
    
    fileCount = size(allFiles);
    fileCount = fileCount(1);
    %fileData = {}
    fileIndex = 1;
    
    for i = 3:fileCount
        %disp(allFiles(i).name)
        %fileName = allFiles(i).name;
        fileName = split(allFiles(i).name, ".");
        
        if(fileName(2) == "s4p")
            %disp("S-Parameter file found")
            
            params = split(fileName(1), "_");
            fileData(fileIndex).sample = params{1};
            fileData(fileIndex).V1 = params{2};
            fileData(fileIndex).V2 = params(3);
            fileData(fileIndex).Vbias = params(4);
            fileData(fileIndex).FileName = allFiles(i).name;
    
            fileIndex = fileIndex + 1;
        end
    
       
    end

end




