<template>
    <div class="container mt-4 pt-4">
        <div class="row mt-4" v-if="!loggedIn">
            <div class="col-6 offset-3">
                <div class="card">
                    <div class="card-body">
                        <!-- Login Screen -->
                        <form v-if="screen == 'login'" action="#" @submit.prevent="handleLogin">
                            <h3>Login form</h3>
                            <div class="form-row" v-if="loginAuthErrors?.message">
                                <div class="alert alert-danger" role="alert" v-text="loginAuthErrors?.message"></div>
                            </div>
                            <div class="form-row">
                                <input type="email" name="email" v-model="loginFormData.email" class="form-control"
                                    :class="{ 'is-invalid': loginAuthErrors?.errors?.email }" placeholder="Email Address">
                                <div class="invalid-feedback" v-for="msg in loginAuthErrors?.errors?.email" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <input type="password" name="password" v-model="loginFormData.password"
                                    :class="{ 'is-invalid': loginAuthErrors?.errors?.password }" class="form-control"
                                    placeholder="Password">
                                <div class="invalid-feedback" v-for="msg in loginAuthErrors?.errors?.password" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <button type="submit" class="btn btn-primary">Login</button>
                                <button type="button" class="btn btn-link"
                                    v-on:click="screen = 'register'">Register?</button>
                            </div>
                        </form>

                        <!-- Register Screen -->
                        <form v-if="screen == 'register'" action="#" @submit.prevent="handleRegister">
                            <h3>Login form</h3>
                            <div class="form-row" v-if="registerAuthErrors?.message">
                                <div class="alert alert-danger" role="alert" v-text="registerAuthErrors?.message"></div>
                            </div>
                            <div class="form-row">
                                <input type="text" name="name" v-model="registerFormData.name" class="form-control"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.name }" placeholder="Full Name">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.name" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <input type="email" name="email" v-model="registerFormData.email" class="form-control"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.email }"
                                    placeholder="Email Address">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.email" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <input type="password" name="password" v-model="registerFormData.password"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.password }" class="form-control"
                                    placeholder="Password">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.password"
                                    v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <input type="password" name="password_confirmation"
                                    v-model="registerFormData.password_confirmation"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.password_confirmation }"
                                    class="form-control" placeholder="Password Confirmation">
                                <div class="invalid-feedback"
                                    v-for="msg in registerAuthErrors?.errors?.password_confirmation" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <button type="submit" class="btn btn-primary">Register</button>
                                <button type="button" class="btn btn-link" v-on:click="screen = 'login'">login?</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Posts Screen -->
        <div class="row mt-4" v-if="loggedIn">
            <div class="col-10 offset-1 mb-4">
                <!-- Add Post Modal -->
                <button type="button" class="btn btn-dark mr-5" data-bs-toggle="modal" data-bs-target="#addPostModal">
                    Add Post
                </button>
                <!-- Add Post Modal -->
                <div class="modal fade" id="addPostModal" tabindex="-1" aria-labelledby="addPostModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="addPostModalLabel">Add Post</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="#" @submit.prevent="addPost">
                                    <label class="form-label" for="Title">Title</label>
                                    <div class="form-row" v-if="addPostFormErrors?.message">
                                        <div class="alert alert-danger" role="alert" v-text="addPostFormErrors?.message"></div>
                                    </div>
                                    <div class="form-row">
                                        <input type="title_en" name="title_en" v-model="addPostForm.title_en" class="form-control"
                                            :class="{ 'is-invalid': addPostFormErrors?.errors?.title_en }" placeholder="English">
                                        <div class="invalid-feedback" v-for="msg in addPostFormErrors?.errors?.title_en" v-text="msg">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <input type="title_ar" name="title_ar" v-model="addPostForm.title_ar" class="form-control"
                                            :class="{ 'is-invalid': addPostFormErrors?.errors?.title_ar }" placeholder="العربية">
                                        <div class="invalid-feedback" v-for="msg in addPostFormErrors?.errors?.title_ar" v-text="msg">
                                        </div>
                                    </div>
                                    <div class="form-row mb-5">
                                        <input type="title_ku" name="title_ku" v-model="addPostForm.title_ku" class="form-control"
                                            :class="{ 'is-invalid': addPostFormErrors?.errors?.title_ku }" placeholder="کوردی">
                                        <div class="invalid-feedback" v-for="msg in addPostFormErrors?.errors?.title_ku" v-text="msg">
                                        </div>
                                    </div>
                                    <label class="form-label" for="content">Content</label>
                                    <div class="form-floating mb-2">
                                        <textarea name="content_en" class="form-control" v-model="addPostForm.content_en" placeholder="English" id="content_en" :class="{ 'is-invalid': addPostFormErrors?.errors?.content_en }"></textarea>
                                        <label for="content_en">English</label>
                                    </div>
                                    <div class="form-floating mb-2">
                                        <textarea name="content_ar" class="form-control" v-model="addPostForm.content_ar" placeholder="العربية" id="content_ar" :class="{ 'is-invalid': addPostFormErrors?.errors?.content_ar }"></textarea>
                                        <label for="content_ar">العربية</label>
                                    </div>
                                    <div class="form-floating mb-2">
                                        <textarea name="content_ku" class="form-control" v-model="addPostForm.content_ku" placeholder="کوردی" id="content_ku" :class="{ 'is-invalid': addPostFormErrors?.errors?.content_ku }"></textarea>
                                        <label for="content_ku">کوردی</label>
                                    </div><br><br>
                                    <div class="form-row mb-5" v-if="this.categories">
                                        <label class="form-label" for="category_id mb-2">Category</label><br>
                                        <select name="category_id" v-model="addPostForm.category_id" class="form-select" aria-label="Default select example">
                                            <option selected disabled></option>
                                            <option v-for="category in this.categories" :value="category?.id" v-text="this.language == 'en' ? category?.title?.en : (this.language == 'ar' ? category?.title?.ar : category?.title?.ku)"></option>
                                        </select>
                                    </div>
                                    <div class="form-row">
                                        <label class="form-label" for="imageFile">Image</label>
                                        <input type="file" name="image" ref="imageInput" class="form-control" />
                                    </div>
                                    <div class="form-row mt-5">
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Update Post Modal -->
                <div class="modal fade" id="updatePostModal" tabindex="-1" aria-labelledby="updatePostModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="updatePostModalLabel">Update Post</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="#" @submit.prevent="updatePost">
                                    <label class="form-label" for="Title">Title</label>
                                    <div class="form-row" v-if="updatePostFormErrors?.message">
                                        <div class="alert alert-danger" role="alert" v-text="updatePostFormErrors?.message"></div>
                                    </div>
                                    <div class="form-row">
                                        <input type="title_en" name="title_en" v-model="updatePostForm.title_en" class="form-control"
                                            :class="{ 'is-invalid': updatePostFormErrors?.errors?.title_en }" placeholder="English">
                                        <div class="invalid-feedback" v-for="msg in updatePostFormErrors?.errors?.title_en" v-text="msg">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <input type="title_ar" name="title_ar" v-model="updatePostForm.title_ar" class="form-control"
                                            :class="{ 'is-invalid': updatePostFormErrors?.errors?.title_ar }" placeholder="العربية">
                                        <div class="invalid-feedback" v-for="msg in updatePostFormErrors?.errors?.title_ar" v-text="msg">
                                        </div>
                                    </div>
                                    <div class="form-row mb-5">
                                        <input type="title_ku" name="title_ku" v-model="updatePostForm.title_ku" class="form-control"
                                            :class="{ 'is-invalid': updatePostFormErrors?.errors?.title_ku }" placeholder="کوردی">
                                        <div class="invalid-feedback" v-for="msg in updatePostFormErrors?.errors?.title_ku" v-text="msg">
                                        </div>
                                    </div>
                                    <label class="form-label" for="content">Content</label>
                                    <div class="form-floating mb-2">
                                        <textarea name="content_en" class="form-control" v-model="updatePostForm.content_en" placeholder="English" id="content_en" :class="{ 'is-invalid': updatePostFormErrors?.errors?.content_en }"></textarea>
                                        <label for="content_en">English</label>
                                    </div>
                                    <div class="form-floating mb-2">
                                        <textarea name="content_ar" class="form-control" v-model="updatePostForm.content_ar" placeholder="العربية" id="content_ar" :class="{ 'is-invalid': updatePostFormErrors?.errors?.content_ar }"></textarea>
                                        <label for="content_ar">العربية</label>
                                    </div>
                                    <div class="form-floating mb-2">
                                        <textarea name="content_ku" class="form-control" v-model="updatePostForm.content_ku" placeholder="کوردی" id="content_ku" :class="{ 'is-invalid': updatePostFormErrors?.errors?.content_ku }"></textarea>
                                        <label for="content_ku">کوردی</label>
                                    </div><br><br>
                                    <div class="form-row mb-5" v-if="this.categories">
                                        <label class="form-label" for="category_id mb-2">Category</label><br>
                                        <select name="category_id" v-model="updatePostForm.category_id" class="form-select" aria-label="Default select example">
                                            <option selected disabled></option>
                                            <option v-for="category in this.categories" :value="category?.id" v-text="this.language == 'en' ? category?.title?.en : (this.language == 'ar' ? category?.title?.ar : category?.title?.ku)"></option>
                                        </select>
                                    </div>
                                    <div class="form-row mt-5">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="btn-group" role="group" aria-label="Basic outlined example">
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'en'">English</button>
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'ar'">العربية</button>
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'ku'">کوردی</button>
                </div>

                <button type="button" class="btn btn-light dropdown-toggle float-end" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    Hi, <label v-text="this.user?.name"></label>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" v-on:click="handleLogout()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z" />
                                <path fill-rule="evenodd"
                                    d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z" />
                            </svg>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
            <br>

            <div class="col-6 offset-1">
                <h3 class="mb-4">My Posts</h3>
                <Bootstrap5Pagination :data="posts" @pagination-change-page="getPosts" />
                <div class="mb-2"></div>
                <div class="post" v-for="(post, index) in posts?.data" :key="post.id">
                    <div class="card mb-2">
                        <img :src="post?.imageUrl" class="card-img-top" :alt="post?.title?.en">
                        <div class="card-body">
                            <h5 class="card-title" v-if="language == 'en'" v-text="post?.title?.en"></h5>
                            <h5 class="card-title" v-if="language == 'ar'" v-text="post?.title?.ar"></h5>
                            <h5 class="card-title" v-if="language == 'ku'" v-text="post?.title?.ku"></h5>
                            <p class="card-text" v-if="language == 'en'" v-text="post?.content?.en"></p>
                            <p class="card-text" v-if="language == 'ar'" v-text="post?.content?.ar"></p>
                            <p class="card-text" v-if="language == 'ku'" v-text="post?.content?.ku"></p>
                            <small class="card-text"><b>Created At:</b> </small>
                            <small class="card-text" v-text="post?.created_at"></small><br>
                            <small class="card-text"><b>Updated At:</b> </small>
                            <small class="card-text" v-text="post?.updated_at"></small><br>
                            <div class="btn-group me-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#updatePostModal" @click="setUpdatePostModalValue(post)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path
                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                        <path fill-rule="evenodd"
                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-light" @click="deletePost(post?.id)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-trash" viewBox="0 0 16 16">
                                        <path
                                            d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
                                        <path
                                            d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div><br>
                <div class="mb-2"></div>
                <Bootstrap5Pagination :data="posts" @pagination-change-page="getPosts" />
            </div>
            <div class="col-4">
                <h3>Categories</h3>
                <ul class="list-group mt-4" v-if="categories.length">
                    <li class="list-group-item d-flex justify-content-between align-items-center"
                        v-for="category in categories" :key="category.id">
                        <div v-if="language == 'en'" v-text="category?.title?.en"></div>
                        <div v-if="language == 'ar'" v-text="category?.title?.ar"></div>
                        <div v-if="language == 'ku'" v-text="category?.title?.ku"></div>
                        <span class="badge bg-primary rounded-pill" v-text="category?.posts_count"></span>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</template>

<script>
import { Bootstrap5Pagination } from 'laravel-vue-pagination';
export default {
    components: {
        Bootstrap5Pagination,
    },
    data() {
        return {
            language: 'en',
            loggedIn: false,
            screen: 'login',
            token: '',
            headers: {},
            loginAuthErrors: {},
            registerAuthErrors: {},
            loginFormData: {
                email: '',
                password: '',
            },
            registerFormData: {
                name: '',
                email: '',
                password: '',
                password_confirmation: '',
            },
            user: {},
            posts: {},
            addPostForm: {
                title_en: '',
                title_ar: '',
                title_ku: '',
                content_en: '',
                content_ar: '',
                content_ku: '',
                category_id: null,
            },
            updatePostForm: {
                id: 0,
                title_en: '',
                title_ar: '',
                title_ku: '',
                content_en: '',
                content_ar: '',
                content_ku: '',
                category_id: null,
            },
            addPostFormErrors: {},
            updatePostFormErrors: {},
            categories: [],
        }
    },
    methods: {
        handleLogin() {
            axios.get('/sanctum/csrf-cookie').then((response) => {
                axios.post('/api/login', this.loginFormData).then((response) => {
                    this.loggedIn = true
                    this.user = response.data?.user;
                    const config = {
                        headers: {
                            Accept: 'application/json',
                            Authorization: `Bearer ${response.data?.token}`
                        }
                    }
                    this.token = `Bearer ${response.data?.token}`
                    this.headers = config
                    this.getCategories()
                    this.getPosts()
                }, (errors) => {
                    this.loginAuthErrors = errors.response?.data
                    this.loggedIn = false
                })
            })
        },
        handleRegister() {
            axios.get('/sanctum/csrf-cookie').then((response) => {
                axios.post('/api/register', this.registerFormData).then((response) => {
                    this.loggedIn = true
                    const config = {
                        headers: {
                            Accept: 'application/json',
                            Authorization: `Bearer ${response.data?.token}`
                        }
                    }
                    this.token = `Bearer ${response.data?.token}`
                    this.headers = config
                    this.getCategories()
                    this.getPosts()
                }, (errors) => {
                    this.registerAuthErrors = errors.response?.data
                    this.loggedIn = false
                })
            })
        },
        handleLogout() {
            axios.get('/sanctum/csrf-cookie').then(() => {
                axios.post('/api/logout', {}, this.headers).then(() => {
                        this.resetAuthForm()
                        this.loggedIn = false
                    },
                    () => this.loggedIn = false
                )
            })
        },
        getPosts(page = 1) {
            axios.get('/api/posts?page=' + page, this.headers).then((response) => {
                this.posts = response.data
                console.log(this.posts)
            }, () => this.loggedIn = false)
        },
        getCategories() {
            axios.get('/api/categories', this.headers).then((response) => {
                console.log(response.data)
                this.categories = response.data
                console.log(this.categories)
            }, () => this.loggedIn = false)
        },
        async addPost() {
            const formData = new FormData();
            formData.append('title_en', this.addPostForm.title_en);
            formData.append('title_ar', this.addPostForm.title_ar);
            formData.append('title_ku', this.addPostForm.title_ku);
            formData.append('content_en', this.addPostForm.content_en);
            formData.append('content_ar', this.addPostForm.content_ar);
            formData.append('content_ku', this.addPostForm.content_ku);
            formData.append('category_id', this.addPostForm.category_id);
            formData.append('image', this.$refs.imageInput.files[0]);
            await axios.post('/api/posts', formData, this.headers).then(() => {
                this.resetAddPostForm()
                this.getPosts()
                this.getCategories()
            }, () => {})
        },
        async updatePost() {
            await axios.patch('/api/posts/' + this.updatePostForm?.id, this.updatePostForm, this.headers).then(() => {
                this.getPosts()
                this.getCategories()
            }, () => {})
        },
        async deletePost(postId) {
            await axios.delete('/api/posts/' + postId, this.headers).then(() => {
                this.getPosts()
                this.getCategories()
            }, () => {})
        },
        resetAuthForm() {
            this.loginFormData = {
                email: '',
                password: '',
            }
            this.registerFormData = {
                name: '',
                email: '',
                password: '',
                password_confirmation: '',
            }
        },
        resetAddPostForm() {
            this.addPostForm = {
                title_en: '',
                title_ar: '',
                title_ku: '',
                content_en: '',
                content_ar: '',
                content_ku: '',
                category_id: null
            }
            this.$refs.imageInput.value = '';
        },
        setUpdatePostModalValue(post) {
            this.updatePostForm = {
                id: post?.id,
                title_en: post?.title?.en,
                title_ar: post?.title?.ar,
                title_ku: post?.title?.ku,
                content_en: post?.content?.en,
                content_ar: post?.content?.ar,
                content_ku: post?.content?.ku,
                category_id: post?.category?.id,
            }
        },
    },
}
</script>

<style>
.form-row {
    margin-bottom: 8px;
}

.mr-5 {
    margin-right: 5px;
}</style>
