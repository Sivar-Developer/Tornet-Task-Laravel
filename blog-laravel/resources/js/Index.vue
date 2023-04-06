<template>
    <div class="container mt-4 pt-4">
        <div class="row mt-4" v-if="!loggedIn">
            <div class="col-6 offset-3">
                <div class="card">
                    <div class="card-body">
                        <!-- Login Screen -->
                        <form v-if="screen == 'login'" action="#" @submit.prevent="handleLogin">
                            <h3>Login form</h3>
                            <div class="form-row">
                                <input type="email" name="email" v-model="loginFormData.email" class="form-control"
                                    :class="{ 'is-invalid': loginAuthErrors?.errors?.email }" placeholder="Email Address">
                                <div class="invalid-feedback" v-for="msg in loginAuthErrors?.errors?.email" v-text="msg"></div>
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
                                <button type="button" class="btn btn-link" v-on:click="screen = 'register'">Register?</button>
                            </div>
                        </form>

                        <!-- Register Screen -->
                        <form v-if="screen == 'register'" action="#" @submit.prevent="handleRegister">
                            <h3>Login form</h3>
                            <div class="form-row">
                                <input type="text" name="name" v-model="registerFormData.name" class="form-control"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.name }" placeholder="Full Name">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.name" v-text="msg"></div>
                            </div>
                            <div class="form-row">
                                <input type="email" name="email" v-model="registerFormData.email" class="form-control"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.email }" placeholder="Email Address">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.email" v-text="msg"></div>
                            </div>
                            <div class="form-row">
                                <input type="password" name="password" v-model="registerFormData.password"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.password }" class="form-control"
                                    placeholder="Password">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.password" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <input type="password" name="password_confirmation" v-model="registerFormData.password_confirmation"
                                    :class="{ 'is-invalid': registerAuthErrors?.errors?.password_confirmation }" class="form-control"
                                    placeholder="Password Confirmation">
                                <div class="invalid-feedback" v-for="msg in registerAuthErrors?.errors?.password_confirmation" v-text="msg">
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
            <div class="col-8">
                <h3>My Posts</h3>
                <div class="btn-group float-right" role="group" aria-label="Basic outlined example">
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'en'">English</button>
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'ar'">العربية</button>
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'ku'">کوردی</button>
                </div>
                <div class="post" v-for="(post, index) in posts?.data" :key="post.id">
                    <em v-text="post?.created_at"></em><br>
                    <strong v-if="language == 'en'" v-text="post?.title?.en"></strong>
                    <strong v-if="language == 'ar'" v-text="post?.title?.ar"></strong>
                    <strong v-if="language == 'ku'" v-text="post?.title?.ku"></strong>
                </div>
                <Bootstrap5Pagination :data="posts" @pagination-change-page="getPosts" />
            </div>
            <div class="col-4">
                <h3>Categories</h3>
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
            posts: {},
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
        }
    },
    methods: {
        handleLogin() {
            axios.get('/sanctum/csrf-cookie').then((response) => {
                axios.post('/api/login', this.loginFormData).then((response) => {
                    this.loggedIn = true
                    const config = {
                        headers: {
                            'Accept': 'application/json',
                            'Authorization': `Bearer ${response.data?.token}`
                        }
                    }
                    this.headers = config
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
                    this.getPosts()
                }, (errors) => {
                    this.registerAuthErrors = errors.response?.data
                    this.loggedIn = false
                })
            })
        },
        getPosts(page = 1) {
            axios.get('/api/posts?page=' + page, this.headers).then((response) => {
                this.posts = response.data
                console.log(this.posts)
            }, () => this.loggedIn = false)
        },
    },
}
</script>

<style>
.form-row {
    margin-bottom: 8px;
}
</style>
