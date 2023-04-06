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
                <button type="button" class="btn btn-dark mr-5">Add Post</button>
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
                        </a></li>
                </ul>
            </div>
            <br>
            <div class="col-6 offset-1">
                <h3 class="mb-4">My Posts</h3>
                <div class="post" v-for="(post, index) in posts?.data" :key="post.id">
                    <div class="card mb-2">
                        <div class="card-body">
                            <h5 class="card-title" v-if="language == 'en'" v-text="post?.title?.en"></h5>
                            <h5 class="card-title" v-if="language == 'ar'" v-text="post?.title?.ar"></h5>
                            <h5 class="card-title" v-if="language == 'ku'" v-text="post?.title?.ku"></h5>
                            <p class="card-text" v-text="post?.created_at"></p>
                            <div class="btn-group me-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-light">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path
                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                        <path fill-rule="evenodd"
                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-light">
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
            categories: []
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
                            'Accept': 'application/json',
                            'Authorization': `Bearer ${response.data?.token}`
                        }
                    }
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
                            'Accept': 'application/json',
                            'Authorization': `Bearer ${response.data?.token}`
                        }
                    }
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
