package org.swizframework.storage
{
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	/**
	 * @see org.swizframework.storage.IEncryptedLocalStorageBean
	 *
	 */
	public class EncryptedLocalStorageBean implements IEncryptedLocalStorageBean
	{
		
		public function EncryptedLocalStorageBean()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function reset():void
		{
			EncryptedLocalStore.reset();
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeItem( name:String ):void
		{
			EncryptedLocalStore.removeItem( name );
		}
		
		/**
		 * @inheritDoc
		 */
		public function getString( name:String ):String
		{
			var ba:ByteArray = EncryptedLocalStore.getItem( name );
			if( ba != null )
				return ba.readUTFBytes( ba.length );
			return null;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setString( name:String, s:String, stronglyBound:Boolean = false ):void
		{
			var ba:ByteArray = new ByteArray();
			ba.writeUTFBytes( s );
			EncryptedLocalStore.setItem( name, ba, stronglyBound );
		}
		
		/**
		 * @inheritDoc
		 */
		public function getBoolean( name:String ):Boolean
		{
			var ba:ByteArray = EncryptedLocalStore.getItem( name );
			if( ba != null )
				return ba.readBoolean();
			return undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setBoolean( name:String, b:Boolean, stronglyBound:Boolean = false ):void
		{
			var ba:ByteArray = new ByteArray();
			ba.writeBoolean( b );
			EncryptedLocalStore.setItem( name, ba, stronglyBound );
		}
		
		/**
		 * @inheritDoc
		 */
		public function getObject( name:String ):Object
		{
			var ba:ByteArray = EncryptedLocalStore.getItem( name );
			if( ba != null )
				return ba.readObject();
			return null;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setObject( name:String, o:Object, stronglyBound:Boolean = false ):void
		{
			var ba:ByteArray = new ByteArray();
			ba.writeObject( o );
			EncryptedLocalStore.setItem( name, ba, stronglyBound );
		}
	}
}