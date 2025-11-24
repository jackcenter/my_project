#!/usr/bin/env python3
import json
import sys

if len(sys.argv) != 3:
    print("Usage: json_to_header.py input.json output.h")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

with open(input_file, "r") as f:
    config = json.load(f)

with open(output_file, "w") as f:
    f.write("#pragma once\n\n")
    f.write("namespace Config {\n")
    for key, value in config.items():
        if isinstance(value, str):
            f.write(f'    constexpr auto {key} = "{value}";\n')
        else:
            f.write(f"    constexpr auto {key} = {value};\n")
    f.write("}\n")
