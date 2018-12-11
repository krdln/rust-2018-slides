use std::collections::HashSet;

fn get_some_words() -> String { "hello dark world hello".into() }
fn get_bad_word() -> String { "dark".into() }

fn split<'a>(s: &'a str, bad: &'a str) -> HashSet<&'a str> {
    s.split_whitespace()
        .filter(|&s| s != bad)
        .collect()
}

fn main() {
    let data = get_some_words();
    let mut bad = get_bad_word();
    let words = split(&data, &bad);

    bad.clear();
    println!("{:?}", words);
}
