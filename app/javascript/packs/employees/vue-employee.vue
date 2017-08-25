<template>
    <v-layout row>
        <v-flex xs12 sm6 offset-sm3>
            <v-card class="mb-2">
                <v-card-title primary-title>
                    <div>
                        <h5>{{ employee.fname }} {{ employee.lname }}</h5>
                        <div>{{ employee.position }}</div>
                    </div>
                </v-card-title>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    module.exports = {
        data: function() {
            return {
                employee: JSON.parse(this.card)
            }
        },
        props: ['card'],
        mounted() {
            console.log(this.employee + ' created')
        }
    }
</script>