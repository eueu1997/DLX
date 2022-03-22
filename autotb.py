

if __name__ == "__main__":

    entity = input("Insert design to be tested")
    fr = open(f"{entity}.vhd","r").read()
    fr = fr.split("entity")[1]
    component = fr.split(f"{entity}")[1]
    tbname = f"{entity}_tb"
    fp = open(f"{tbname}.vhd","w")
    fp.write("library ieee;\nuse ieee.std_logic_1164.all;\n\n")
    fp.write(f"entity {tbname} is\nend {tbname};\n\n")
    fp.write(f"architecture tb of {tbname} is\n\n")
    fp.write(f"component {entity} {component} component;\n\n")
    port=component.split("port")[1]
    port = port.split(";")
    for signal in port :
        signal = signal.replace(":","")
        signal = signal.replace("\n\t\t","")
        name = signal.split(" ")[0]
        type = signal.split(" ")[2]
        fp.write(f"signal {name}_s {type};\n ")
        
    fp.write("\n\nbegin\n\n")