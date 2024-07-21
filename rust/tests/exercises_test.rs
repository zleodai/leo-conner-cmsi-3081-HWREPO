use exercises;

#[test]
fn change_works() {
    assert_eq!(exercises::change(0), Ok((0, 0, 0, 0)));
    assert_eq!(exercises::change(-50), Err("Amount must be positive"));
    assert_eq!(exercises::change(1), Ok((0, 0, 0, 1)));
    assert_eq!(exercises::change(99), Ok((3, 2, 0, 4)));
    assert_eq!(exercises::change(42), Ok((1, 1, 1, 2)));
    assert_eq!(exercises::change(100000000037), Ok((4000000001, 1, 0, 2)));
    assert_eq!(exercises::change(10000000000005), Ok((400000000000, 0, 1, 0)));
}
