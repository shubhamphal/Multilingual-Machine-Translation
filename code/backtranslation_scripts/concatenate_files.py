import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input1")
    parser.add_argument("--input2")
    parser.add_argument("--output")
    args = parser.parse_args() 
    with open(args.input1) as f1:
        first_file = f1.readlines()
    with open(args.input2) as f2:
        second_file = f2.readlines()

    concat = []
    firstfilesegments = []
    secondfilesegments = []
    for i in range(0,len(first_file)):
        segment1 = first_file[i]
        segment2 = second_file[i]
        if len(segment1.split()) >= 2 and len(segment2.split()) >= 2:
            firstfilesegments.append(segment1)
            secondfilesegments.append(segment2)
            segment3 = segment1.rstrip()+". ||| "+segment2.rstrip()+"\n"
            concat.append(segment3)

    with open(args.output,'w') as f3:
        f3.writelines(concat)

#     first_file = "pre"+args.input1
#     second_file = args.input2
#     with open(first_file,'w') as f4:
#         f4.writelines(firstfilesegments)
        
#     with open(second_file,'w') as f5:
#         f5.writelines(secondfilesegments)
        
main()


