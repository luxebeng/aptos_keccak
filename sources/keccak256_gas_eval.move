module aptos_keccak::hasher_eval {
    use std::vector;
    use std::aptos_hash::keccak256;

    use aptos_keccak::hasher;

    fun empty_keccak() {
        let i = 0;
        while (i < 10) {
            let _keccak = hasher::new();
            i = i + 1;
        }
    }

    fun update_keccak() {
        let keccak = hasher::new();
        let i = 0;
        while (i < 10) {
            hasher::update(&mut keccak, b"The quick brown fox jumps over the lazy dog");
            i = i + 1;
        };
        hasher::finalize(&mut keccak);
    }

    fun finalize_keccak() {
        let keccak = hasher::new();
        let _output = vector::empty();

        hasher::update(&mut keccak, b"The quick brown fox jumps over the lazy dog");
        let i = 0;
        while (i < 10) {
            _output = hasher::finalize(&mut keccak);
            i = i + 1;
        };
    }

    fun update_finalize_keccak() {
        let keccak = hasher::new();

        let i = 0;
        while (i < 10) {
            hasher::update(&mut keccak, b"The quick brown fox jumps over the lazy dog");
            hasher::finalize(&mut keccak);
            i = i + 1;
        };
    }

    // entry point to evaluate gas cost.
    public entry fun main() {
        update_finalize_keccak();
    }

    const DATA: vector<u8> = b"The quick brown fox jumps over the lazy dog";
    public entry fun keccak256_native_test() {
        let data = DATA;
        let i = 0;
        while (i < 10) {
            keccak256(data);
            vector::append(&mut data, DATA);
            i = i + 1;
        };
    }
}