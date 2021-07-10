from rest_framework import serializers
from CustomUser.models import CustomUser



class UserRegSerializers(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input': 'password'}, write_only=True)

    class Meta:
        model = CustomUser
        fields = ['email', 'username', 'password', 'password2', 'user_type','phone_number','province','local_municipality','first_name','last_name']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def save(self):
        CusUser = CustomUser(
            email=self.validated_data['email'],
            username=self.validated_data['username'],
            user_type=self.validated_data['user_type'],
            first_name=self.validated_data['first_name'],
            last_name=self.validated_data['last_name'],
            phone_number=self.validated_data['phone_number'],
            province=self.validated_data['province'],
            local_municipality=self.validated_data['local_municipality'],
        )

        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'passwords must match'})
        else:
            CusUser.set_password(password)
            CusUser.save()
            return CusUser
