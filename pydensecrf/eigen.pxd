cdef extern from "Eigen/Dense":
    cdef cppclass c_MatrixXf "Eigen::MatrixXf":
        float* data()
        Py_ssize_t cols()
        Py_ssize_t rows()

    cdef cppclass c_VectorXf "Eigen::VectorXf":
        float* data()
        Py_ssize_t size()
        


cdef extern from "eigen_impl.cpp":
    c_VectorXf c_buf2vecf "buf2vecf" (float *mem, Py_ssize_t n)
    void c_vecf2buf "vecf2buf" (const c_VectorXf &mat, float *buf)
    c_MatrixXf c_buf2matf "buf2matf" (float *mem, Py_ssize_t h, Py_ssize_t w)
    void c_matf2buf "matf2buf" (const c_MatrixXf &mat, float *buf)
    # new add 
#     cdef cppclass c_VectorXs"VectorXs"
#     c_VectorXs c_buf2vecs "buf2vecs" (float *mem, Py_ssize_t n)
    


cdef class VectorXf:
    cdef c_VectorXf v
    cdef Py_ssize_t  shape[1]
    cdef Py_ssize_t strides[1]

    cdef VectorXf wrap(self, c_VectorXf v)

cdef c_VectorXf c_vectorXf(float[::1] arr)
# new add 2 define
# cdef c_VectorXs c_vectorXs(float[::1] arr)
cdef c_VectorXf* pc_vectorXf(float[::1] arr)

cdef class MatrixXf:
    cdef c_MatrixXf m
    cdef Py_ssize_t shape[2]
    cdef Py_ssize_t strides[2]

    cdef MatrixXf wrap(self, c_MatrixXf m)

cdef c_MatrixXf c_matrixXf(float[:,::1] arr)
