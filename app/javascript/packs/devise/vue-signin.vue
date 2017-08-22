<template>
    <v-card>
        <v-card-text>
            <v-container>
                <form @submit.prevent="signIn">
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="email"
                                          id="email"
                                          v-model="user.email"
                                          type="email"
                                          placeholder="Email"
                                          required></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="password"
                                          id="password"
                                          v-model="user.password"
                                          type="password"
                                          placeholder="Password"></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-btn type="submit" primary>Sign In</v-btn>
                        </v-flex>
                    </v-layout>
                </form>
            </v-container>
        </v-card-text>
    </v-card>
</template>

<script>
    module.exports = {
        data: function() {
            return {
                user: {
                    email: '',
                    password: '',
                    remember_me: false
                },
                utf8: '',
                authenticity_token: ''
            }
        },
        methods: {
            signIn() {
                this.$http.post('/users/sign_in', { utf8: this.utf8, authenticity_token: this.authenticity_token, user: this.user }).then(
                    response => {
                        console.log(response)
                        Turbolinks.visit('/employees')
                    }, response => {
                        console.log(response)
                    }
                )
            }
        },
        created: function() {
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            console.log('sign in created')
        }
    }
</script>