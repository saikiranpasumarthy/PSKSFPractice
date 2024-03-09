public virtual class Vehicle 
{
	public void model()
    {
        System.debug('Model method of vehicle class');
            
    }
    
    public virtual void speed()
    {
        System.debug('Speed of vehicle depends on type of vehicle');
    }
}