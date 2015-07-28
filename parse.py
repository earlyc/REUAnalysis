file=open("ResultLogs/SVTest1P_LOG.txt","r") 

row = file.readlines()

file.close()

file=open("ResultLogs/SVTest1P_LOG_Parsed.txt","w") 

output = ''
total = 0

file.write("TestFile,ModelFile,Time,TotalRows,Correct,Incorrect,Accuracy\n")

for line in row:
    if line.find("'DataProcessNew/XMLFiles/") > -1:
        spaces = line.split()
        slashes = line.split('/')
        output += slashes[4][:-6] + ", "
    elif line.find("pre-trained model") > -1:
        spaces = line.split()
        slashes = line.split('/')
        output += slashes[2][:-2] + ", "
    elif line.find("Correct classifications") > -1:
        spaces = line.split()
        correct = spaces[2] + ", "
        percentage = spaces[3][1:-2]
        total += int(spaces[2])
    elif line.find("Incorrect classifications") > -1:
        spaces = line.split()
        incorrect = spaces[2] + ", "
        total += int(spaces[2])
    elif line.find("Total Time") > -1:
        spaces = line.split(' ')
        output += spaces[2] + ", " + str(total) + ", " + correct + incorrect + percentage
        total = 0
        file.write(output + "\n")
        output = ''
        
file.close()