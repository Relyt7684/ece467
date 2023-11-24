// Testing for function parameters
int main(int a, bool b, int c[], bool d, bool e[]){
    int z[2];
    bool y[3];
    a = 1;
    b = true;
    z[666] = 1;
    y[777] = true;
    c[100] = 2;
    a = c[666];
    return a;
}