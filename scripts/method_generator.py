import csv

def run():
    with open('./public_methods.csv') as csvfile:
        dictReader = csv.DictReader(csvfile)
        method_dict = list(dictReader)
        update_buzz_booster(method_dict)

def update_buzz_booster(method_dict):
    print("update buzz_booster.dart")
    f = open("../src/BuzzBooster.tsx", "w")
    f.write("import { NativeModules, Platform } from 'react-native';\n\n")

    write_liniking_error(f)
    write_get_module(f)
    write_init_func(f)
    write_methods(f, method_dict)
    f.close()

def write_liniking_error(f):
    f.write("const LINKING_ERROR =\n")
    f.write("  `The package 'react-native-buzz-booster' doesn't seem to be linked. Make sure: \\n\\n` +\n")
    f.write("  Platform.select({ ios: \"- You have run 'pod install'\\n\", default: '' }) +\n")
    f.write("  '- You rebuilt the app after installing the package\\n' +\n")
    f.write("  '- You are not using Expo managed workflow\\n';\n")

def write_get_module(f):
    f.write("const BuzzBooster = NativeModules.BuzzBooster  ? NativeModules.BuzzBooster  : new Proxy(\n")
    f.write("    {},\n")
    f.write("    {\n")
    f.write("            get() { throw new Error(LINKING_ERROR);},\n")
    f.write("    }\n")
    f.write("  );\n\n")


def write_init_func(f):
    f.write("interface AppKey {\n")
    f.write("  androidAppKey: string\n")
    f.write("  iosAppKey: string\n")
    f.write("}\n\n")

    f.write("export function init({androidAppKey,iosAppKey}: AppKey) {\n")
    f.write("  if (Platform.OS === 'android') {\n")
    f.write("    BuzzBooster.initAndroidApp(androidAppKey)\n")
    f.write("  } else if (Platform.OS === 'ios') {\n")
    f.write("    BuzzBooster.initIosApp(iosAppKey)\n")
    f.write("  } else {\n")
    f.write("    throw new Error(\"unsupported platform\");\n")
    f.write("  }\n")
    f.write("}\n\n")


def write_methods(f, method_dict):
    for row in method_dict:
        method_name = row["method_name"]
        f.write(f"export function {method_name}(")
        # add args
        for index in range(0,3):
            args_name_key = (f"args_name{index}")
            args_type_key = (f"args_type{index}")

            args_name = row[args_name_key]
            args_type = row[args_type_key]

            if args_name == None:
                break
            if index > 0:
                f.write(", ")
            f.write(f"{args_name}: {args_type}")
        f.write(") {\n")
        f.write(f"  BuzzBooster.{method_name}(")

        # input args
        for index in range(0,3):
            args_name_key = f"args_name{index}"
            args_name = row[args_name_key]

            if args_name == None:
                break
            if index > 0:
                f.write(", ")
            if '?' not in args_name:
                print("not in")
                f.write(f"{args_name}")
            else:
                print("in")
                f.write(f"{args_name[0:len(args_name)-1]}")
        f.write(")\n")
        f.write("}\n\n")