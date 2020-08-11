class Base {
public:
    virtual int show() { return 10; }
};
 
class Derived: public Base {
public:
    int show() { return 20; } 
};
 
int main(void) {   
    Base *bp = new Derived;     
    bp->show();  // RUN-TIME POLYMORPHISM
    return 0;
}
