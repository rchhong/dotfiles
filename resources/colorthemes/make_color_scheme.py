def hex_to_rgb(hex):
    res = "";
    for i in range(1, len(hex), 2):
        res += str(int(hex[i:i+2], base=16));
        if(i != len(hex) - 2):
            res += ","
    return res;

def to_camel_case(str):
    return str[0:1].upper() + str[1:].lower();

with open("./monokai-soda/monokai-soda.md", 'r') as input_file:
    # Skip to palette
    curr_line = input_file.readline();
    while("## Color Palette" not in curr_line):
        curr_line =      input_file.readline();
    input_file.readline();
    input_file.readline();

    colors = {};

    for curr_line in input_file:
        tokenized_line = curr_line.split('|');
        descriptor = "";
        raw_color = tokenized_line[1][1:-1];
        is_intense = False;
        try:
            color_num = int(tokenized_line[0].split('_')[1]) - 1;
            if(color_num > 7):
                color_num -= 8;
                is_intense = True;

            descriptor = "Color" + str(color_num);
            descriptor += "Intense" if is_intense else "";
            colors[descriptor] = hex_to_rgb(raw_color);
        except ValueError:
            descriptor = to_camel_case(tokenized_line[0].split("_")[0])
            colors[descriptor] = hex_to_rgb(raw_color);
            colors[descriptor + "Intense"] = hex_to_rgb(raw_color);
    print(colors);

