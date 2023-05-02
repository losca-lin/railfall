<template>
  <div style="color: #666;font-size: 14px;">
  <div class="wrapper1">
  <img src="../assets/1.png" />
  </div>

  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  }
}
</script>


