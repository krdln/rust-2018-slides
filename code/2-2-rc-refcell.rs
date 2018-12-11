use std::rc::Rc;
use std::cell::RefCell;

fn main() {
    let v = vec![1, 2, 3];
    let rc1 = Rc::new(RefCell::new(v));
    let rc2 = rc1.clone();

    rc2.borrow_mut().push(4);

    println!("{:?} {:?}", rc1, rc2);

    // let reference: &i32 = &rc1.borrow()[0]; // zabronione
}
