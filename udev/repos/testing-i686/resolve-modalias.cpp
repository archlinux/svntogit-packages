#include <fstream>
#include <fnmatch.h>
#include <string>
#include <iostream>

using std::ifstream;
using std::string;
using std::cout;
using std::endl;

int main(int argc, char *argv[]) {
  ifstream f(argv[1]);
  string line, pattern, module;
  size_t pos1, pos2;

  while(getline(f, line)) {
    pos1 = line.find(' ');
    if(line.substr(0,pos1) == "alias") {
      pos2 = line.find(' ',++pos1);
      pattern = line.substr(pos1,pos2-pos1);
      module = line.substr(pos2+1);

      if(!fnmatch(pattern.c_str(), argv[2], 0))
        cout << module << endl;
    }
  }
  return 0;
}
