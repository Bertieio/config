import os

def list_files_walk(start_path="."):
    for file in os.listdir(start_path):
        home = os.getenv("HOME")
        link_source = os.path.join(home, "config/.config", file)
        link_path = os.path.join(home, ".config", file)
        if os.path.exists(link_path):
            print("Deleting old SymLink " + link_path)
            os.unlink(link_path)
        print("Creating SymLink " + link_source + " to " + link_path)
        os.symlink(link_source, link_path)

directory_path = "./.config"
list_files_walk(directory_path)
