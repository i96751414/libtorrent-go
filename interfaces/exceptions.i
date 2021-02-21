%exception {
    try {
        $action
    } catch (std::exception& e) {
        _swig_gopanic(e.what());
    } catch (...) {
        _swig_gopanic("Unknown exception type");
    }
}
