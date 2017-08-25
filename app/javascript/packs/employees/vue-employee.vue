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
                <v-card-actions>
                    <v-btn flat class="orange--text" @click="createAssignment()">Create Assignment</v-btn>
                </v-card-actions>
                <v-card-text v-if="creatingAssignment">
                    <new-assignment></new-assignment>
                </v-card-text>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    import AssignmentNew from '../assignments/vue-assignment-new.vue'

    export default {
        data: function() {
            return {
                employee: JSON.parse(this.card),
                creatingAssignment: false
            }
        },
        props: ['card'],
        mounted() {
            console.log(this.employee + ' created')
        },
        methods: {
            createAssignment() {
                console.log('create assignment')
                this.creatingAssignment = true
            }
        },
        components: {
            'new-assignment' : AssignmentNew
        }
    }
</script>